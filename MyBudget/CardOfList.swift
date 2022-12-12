//
//  CardOfList.swift
//  MyBudget
//
//  Created by Antimo Cantiello on 12/12/22.
//

import SwiftUI

struct CardOfList: View {
    
    var list : List_
    
    var body: some View {
        
        
        ZStack(alignment: .topLeading){
            
            VStack{
                
                HStack(alignment: .center){
                    
                    Image(systemName: "person.fill")
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.black, lineWidth: 2)
                        ).padding(.top,20)
                    
                    Text(list.title)
                        .bold()
                        .padding(.top,20)
                    
                    Image(systemName: "star")
                        .padding(.top,20)
                    
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                
                HStack(alignment: .center){
                    
                    Text(String(getAlreadYSpend(articles: list.articles)))
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.01)
                        .bold()
                        .padding(.top,20)
                        .foregroundColor(getColorOfSpent(budget: list.budget, totSpent: getAlreadYSpend(articles: list.articles)))
                    
                    Text ("/")
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.01)
                        .bold()
                        .padding(.top,20)
                    
                    Text(String(list.budget))
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.01)
                        .bold()
                        .padding(.top,20)
                    
                    
                    Image(systemName: "chevron.right")
                        .padding(.top,20)
                        .padding(.leading,20)
                        .foregroundColor(.gray)
                    
                }
                .foregroundColor(.black)
                .padding()
                
            }
            
            Rectangle()
                .frame(width: 170, height: 120)
                .cornerRadius(20)
                .foregroundColor(.purple)
                .opacity(0.2)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.purple, lineWidth: 2)
                )
        }.frame(width: 170, height: 120)
        
        
    }
}

func getAlreadYSpend(articles : [Article] ) -> Double{
    
    var total : Double = 0
    
    for article in  articles{
        total += article.price
    }
    
    return Double(round(100 * total) / 100)
    
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
