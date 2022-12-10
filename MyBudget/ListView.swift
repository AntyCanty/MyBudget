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
    //    @State var newListViewisPresented: Bool = false
    
    
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                ForEach(searchResults){ lista in
                    NavigationLink(destination:ListDetailView(lista : lista)){
                        ZStack(alignment: .leading){
                            
                            Image(lista.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .shadow(radius: 10)
                                .frame(height: 100)
                            
                            Rectangle()
                                .fill(LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint:.top, endPoint: .bottom))
                                .frame(height: 100)
                            //.frame(width: 100)
                            
                            
                            VStack(alignment: .leading){
                                Text(lista.title)
                                    .font(.title)
                                    .bold()
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            
                            
                        }
                        
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                    //.onDelete(perform: delete) //IT DOESN'T WORK
                    
                }
                
                .navigationTitle("Lists")
                .searchable(text: $searchText)
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
    
    func delete(at offsets: IndexSet){
        myList.lists.remove(atOffsets: offsets)
    }
}






struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

