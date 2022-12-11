//
//  NewListView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 10/12/22.
//

import SwiftUI

struct NewListView: View {
    
    @ObservedObject var myList = listData
    @ObservedObject var myArticle = articleData
    
    @State var title: String = ""
    @State var budget: Double = 0
    @State var articles : [Article] =  []
    @State var imageName : String = ""
    
    @Binding var newListViewisPresented : Bool
    
    
    var body: some View {
        
        NavigationStack{
            
            Form{
                //FUNCTION ADD IMAGE
                
                Section(header: Text("Title")){
                    TextField("title", text: $title)
                }
                Section(header: Text("Budget")){
                    TextField("budget", value: $budget, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Articles")){
                    //                    List(articles) { article in
                    //FUNCTION ADD ARTICLE
                    
                    //                    }
                }
            }
            .navigationTitle("New List")
                        .toolbar {
                            ToolbarItem{
                                Button{
            
                                    addList(title: title, budget: budget, articles: articles,imageName: imageName)
                                    newListViewisPresented.toggle()
            
                                }label:{
                                    Text("Save")
            
                                }
            
                            }
            
                        }
        }
    }
    
    func addList(title: String, budget: Double, articles: [Article],imageName: String){
        let newList = List_(title: title, budget: budget, articles: articles,imageName: imageName)
        myList.lists.append(newList)
        
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView(newListViewisPresented: .constant(true))
    }
}
