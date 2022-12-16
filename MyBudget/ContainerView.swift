//
//  ContainerView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 10/12/22.
//

import SwiftUI

struct ContainerView: View {
//    @EnvironmentObject var myList : ListData
    var body: some View {
        TabView{
            MainPageView()
            .tabItem{
                Label("Expenses", systemImage: "cart")
            }
            ListView().tabItem{
                    Label("Lists",systemImage: "list.bullet.clipboard")
                }
            FriendsView().tabItem{
                Label("Friends", systemImage: "person.3.fill")
                }
        }
    }
        
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
