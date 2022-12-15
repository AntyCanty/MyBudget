//
//  PieCard.swift
//  MyBudget
//
//  Created by Antimo Cantiello on 15/12/22.
//

import SwiftUI


struct PieCard: View {
    @ObservedObject var myList = listData
    @State var slices: [(Double, Color)]
    
    var body: some View {
        ZStack{
           
            Rectangle()
                .padding(.bottom)
                .frame(width: 350, height: 200)
                .cornerRadius(10)
                .foregroundColor(Color.white)
                .opacity(0.07)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hue: 0.818, saturation: 0.636, brightness: 0.431), lineWidth: 4))
            
            
            
            VStack(alignment: .leading, spacing: 35.0){
                
                Text("Total Budget: " + String(calcTotalBudget()) + "$")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.827, saturation: 0.234, brightness: 0.491))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 160)
                Text("Monthly Exp: " + String(calcTotalSpent()) + "$")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.827, saturation: 0.234, brightness: 0.491))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 160)
                Text("Daily Exp: " + String(calcTotalSpent()) + "$")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.827, saturation: 0.234, brightness: 0.491))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.leading, 160)
                
                
            }
            ZStack{
                Canvas { context, size in
                    
                    let donut = Path { p in
                        p.addEllipse(in: CGRect(origin: .zero, size: size))
                        p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
                    }
                    context.clip(to: donut, style: .init(eoFill: true))

                    var total = round(10*(calcTotalSpent()/calcTotalBudget())*100) / 10
                    if(total >= 100){
                        total = 99.99
                    }
                    
                    context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                    var pieContext = context
                    pieContext.rotate(by: .degrees(-90))
                    let radius = min(size.width, size.height) * 0.29
                    var startAngle = Angle.zero
                    
                    var count = 1
                    for (value, color) in slices {
                        if(count == 1){
                            let angle = Angle(degrees: 360 * (( 360 - ((360 * total)/100)) / value))
                            let endAngle = startAngle + angle
                            let path = Path { p in
                                p.move(to: .zero)
                                p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                                p.closeSubpath()
                                
                            }
                            
                            pieContext.fill(path, with: .color(color))
                            startAngle = endAngle
                        }else{
                            let angle = Angle(degrees: 360 * (0.1 / value))
                            let endAngle = startAngle + angle
                            let path = Path { p in
                                p.move(to: .zero)
                                p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                                p.closeSubpath()
                                
                            }
                            
                            pieContext.fill(path, with: .color(color))
                            startAngle = endAngle
                        }
                        count += 1
                    }
                }
                
                Text(String(round(10*(calcTotalSpent()/calcTotalBudget())*100)/10) + "%").font(.title).fontWeight(.black).foregroundColor(Color(hue: 0.827, saturation: 0.234, brightness: 0.491)).multilineTextAlignment(.center).lineLimit(nil)
            }.frame(width: 250, height: 250)
                .padding(.trailing,180)
            
        }//ZStaxk
        .navigationTitle("Expenses")
        
        .multilineTextAlignment(.trailing)
        .aspectRatio(1, contentMode: .fit)
        .padding(15)
        
    }
    func calcTotalBudget()->Double{
        var totBudget : Double = 0.0
        
        for i in myList.lists{
            totBudget = round(totBudget + i.budget)
        }
        return Double(round(10 * totBudget) / 10)
        
    }

    func calcTotalSpent()->Double{
        var total : Double = 0.0
        
        for i in myList.lists{
            for j in i.articles{
                if(j.brought){
                    total = total + (j.price * j.quantity)
                }
            }
        }
        return Double(round(10 * total) / 10)
    }
//
//    func budgetTitle() -> String{
//
//        var title : String = ""
//
//        if(calcTotalSpent() <= (calcTotalBudget()/2)){
//            title = "You're doing great! 🤩"
//        }
//        else if(calcTotalSpent() > (calcTotalBudget()/2) && calcTotalSpent() < calcTotalBudget()){
//            title = "You're almost over! 😰"
//        }
//        else if(calcTotalSpent() >= calcTotalBudget()){
//            title = "Oh no, You're over! 😭"
//
//        }
//        return title
//    }
}




struct PieCard_Previews: PreviewProvider {
    static var previews: some View {
        PieCard(slices: [
            (360, Color(hue: 0.818, saturation: 0.636, brightness: 0.431)),
            (360, .purple.opacity(0.2))])
    }
}
