//
//  ArticleView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 09/12/22.
//

import SwiftUI

struct ListDetailView: View {
    
    @ObservedObject var myList = listData
    var lista : List_
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            
            List{
                ForEach(lista.articles){ articles in
                    
                    HStack{
                        
                        Text(articles.name + "          " + String(articles.price)+"$")
                        Text("          "+String(articles.quantity) + "          " + String(articles.weight))
                        
                    }
                }
                
            }
            .navigationTitle("Articles")
            
        }
        
        
    }
    
    
    
    
}




struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(lista: listData.lists[0])
    }
}
