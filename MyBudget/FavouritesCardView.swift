//
//  FavouritesCardView.swift
//  MyBudget
//
//  Created by Antimo Cantiello on 15/12/22.
//

import SwiftUI

struct FavouritesCardView: View {
    
    let columns = [
        GridItem(.fixed(155)),
        GridItem(.fixed(150))
    ]
    
    @ObservedObject var myList = listData
    
    var body: some View {
        
        ZStack(alignment: .top){
            Rectangle()
                .padding(.bottom)
                .frame(width: 350, height: 415)
                .cornerRadius(10)
                .foregroundColor(Color.white)
                .opacity(0.07)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hue: 0.818, saturation: 0.636, brightness: 0.431), lineWidth: 4))
            
            
            
            Text("Favourite Lists")
                .bold()
                .frame(width: 240, height: 20, alignment: .top)
                .padding(.top,10)

                
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    
                    ForEach(myList.lists){ lista in
                        NavigationLink(destination:ListDetailView(lista: lista)){
                            
                            CardOfList(list : lista, width_: 140, height_: 140)
                            
                        }
                    }
                }
                .padding(.top, 50)
            }
            //.padding(.top,200)
        }
        .frame(height: 415)
    }
}

struct FavouritesCardView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesCardView()
    }
}
