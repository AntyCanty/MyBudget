//
//  CardOfList.swift
//  MyBudget
//
//  Created by Antimo Cantiello on 12/12/22.
//

import SwiftUI

struct CardOfList: View {
    
    var list : List_
    var width_ : CGFloat = 160
    var height_ : CGFloat = 160
    
    var body: some View {
        
        
        ZStack(alignment: .topLeading){
            
            VStack(alignment: .center){
                HStack(){
                    Spacer()
                    if(list.favourite){
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                    }
               
                }
                .padding(.top, 10)
                .padding(.trailing, 10)
                
                HStack(alignment: .center){
                    
                    Image(systemName: list.imageName)
                        .resizable()
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(.black, lineWidth: 1)
//                        )
                        .frame(width: 35,height: 35)
                        .shadow(radius: 10)
                    
                }
                .frame(width: width_ + 10)
                .foregroundColor(.black)
                
                Text(list.title)
                    .bold()
                    .foregroundColor(.black)

                
                    
                Spacer()
                HStack(alignment: .bottom){
                    
                    Text("  "+String(getAlreadYSpend(articles: list.articles)))
                        .font(.body)
                        .bold()
                        .padding(.leading,5)
                        .foregroundColor(getColorOfSpent(budget: list.budget, totSpent: getAlreadYSpend(articles: list.articles)))
                                        
                    Text("/ "+String(list.budget >= 1000 ? (String(round(10 * list.budget/1000) / 10) + "K $") : String( round(10 * list.budget) / 10) + " $"))
                        .font(.body)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .padding(.trailing, 5)
                    
                }
                .frame(width: 150)
                .foregroundColor(.black)
                .padding(.bottom, 15)

                
            }
            
            Rectangle()
                .frame(width: width_ + 10, height: height_ + 10)
                .cornerRadius(20)
                .foregroundColor(Color(hue: 0.827, saturation: 0.234, brightness: 0.491))
                .opacity(0.2)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(.purple, lineWidth: 2)
//                )
        }.frame(width: width_, height: height_)
        
        
        
    }
}

func getAlreadYSpend(articles : [Article] ) -> Double{
    
    var total : Double = 0
    
    for article in  articles{
        if(article.brought){
            total += (article.price * article.quantity)
        }
    }
    
    return Double(round(10 * total) / 10)
    
}

func getColorOfSpent(budget: Double, totSpent : Double) -> Color{
    
    if(totSpent < budget/2){
        return Color.green
    }
    else if(totSpent >= budget/2 && totSpent<budget){
        return Color.orange
    }
    else{
        return Color.red
    }
    
}


struct CardOfList_Previews: PreviewProvider {
    static var previews: some View {
        CardOfList(list: listData.lists[0])
    }
}
