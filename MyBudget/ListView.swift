//
//  ListView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 09/12/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var myList = listData
    @State private var searchText = ""
    @State var newListViewisPresented: Bool = false
    
    let columns = [
        GridItem(.fixed(175)),
        GridItem(.fixed(175))
    ]
    
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 22){
                    ForEach(searchResults){ lista in
                        NavigationLink(destination:ListDetailView(lista: lista)){
                            
                            CardOfList(list : lista)
                            
                        }
                    }
                }
                .navigationTitle("Lists")
                .searchable(text: $searchText)
                .sheet(isPresented: $newListViewisPresented){
                    NewListView(newListViewisPresented: $newListViewisPresented)
                }
                .toolbar{
                    Button{
                        newListViewisPresented.toggle()
                    }label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
    
    var searchResults: [List_] {
        if searchText.isEmpty {
            return myList.lists
        } else {
            return myList.lists.filter{$0.title.contains(searchText)}
        }
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

