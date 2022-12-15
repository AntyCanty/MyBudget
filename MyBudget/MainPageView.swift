//
//  Test.swift
//  MyBudget
//
//  Created by Karan Oroumchi on 13/12/22.
//

import SwiftUI

struct MainPageView: View {
    
    @ObservedObject var myList = listData
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                
                PieCard(slices: [
                    (360, Color(hue: 0.818, saturation: 0.636, brightness: 0.431)),
                    (360, .purple.opacity(0.2))])
                .padding(.top, -30)
                
               FavouritesCardView()
                    .padding(.top, -30)
            }
        }
    }
    
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
        
    }
}
