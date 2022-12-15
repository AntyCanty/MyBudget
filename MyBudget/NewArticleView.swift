//
//  NewArticleView.swift
//  MyBudget
//
//  Created by Antimo Cantiello on 15/12/22.
//

import SwiftUI

struct NewArticleView: View {
    
    @Binding var newArticleViewisPresented : Bool
    
    @State var name: String = ""
    @State var price: Double = 0
    @State var quantity: Double = 1
    
    @State var idList : UUID
        
    @ObservedObject var myList = listData
    
    var body: some View {
        
        NavigationStack{
            
            Form{
                
                Section(header: Text("Title")){
                    TextField("Name", text: $name)
                }
                Section(header: Text("Price")){
                    TextField("Price", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Quantity")){
                    TextField("Quantity", value: $quantity, format: .number)
                        .keyboardType(.decimalPad)
                }
                
            }
            .navigationTitle("New Article")
            .toolbar {
                ToolbarItem{
                    Button{
                        addArticleInList(name: name, price: price, quantity: quantity)
                        
                        newArticleViewisPresented.toggle()
                        
                    }label:{
                        Text("Save")
                        
                    }
                    
                }
                
            }
        }
        
    }
    
    func addArticleInList(name : String, price : Double, quantity : Double){
        
        let index = myList.lists.firstIndex(where: {$0.id == idList})
        
        let newArticle = Article(name: name, price: price, quantity: quantity)
        
        myList.lists[index!].articles.append(newArticle)
        
        
    }
    
}

struct NewArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewArticleView(newArticleViewisPresented: .constant(true), idList: listData.lists[0].id)
    }
}
