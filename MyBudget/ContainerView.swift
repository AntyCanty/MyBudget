//
//  ContainerView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 10/12/22.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView{
            Pie(slices: [
                (1, .purple.opacity(0.4)),
                (2, Color(hue: 0.818, saturation: 0.636, brightness: 0.431))
                
            ]).tabItem{
                Label("Expenses", systemImage: "cart")
            }
            ListView().tabItem{
                    Label("Lists",systemImage: "list.bullet.clipboard")
                }
            FriendsView().tabItem{
                Label("Friends",systemImage: "person.3.fill")
                }.badge(2)
        }
    }
        
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
