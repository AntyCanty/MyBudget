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
            ListView()
                .tabItem{
                    Label("Lists",systemImage: "list.bullet.clipboard")
                }
            
        }
        
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
