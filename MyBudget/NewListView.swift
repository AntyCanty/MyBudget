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
    @State var count : Int = 1
    @State var ArrayOfNames : [String] = [""]
    @State var ArrayOfPrices : [Double] = [0]
    @State var ArrayOfQnt : [Double] = [0]
    
    
    @Binding var newListViewisPresented : Bool
    
    
    var body: some View {
        
        NavigationStack{
            Button{
                ArrayOfNames.append("")
                ArrayOfPrices.append(0)
                ArrayOfQnt.append(0)
                
                count+=1
                print(count)
            }label:{Text("+")}
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
                    List {
                        ForEach(0..<count,id: \.self) { i in
                            
                            
                            HStack{
                                TextField("Name", text:$ArrayOfNames[i])
                                
                                Divider()
                                
                                
                                TextField("Price",  value: $ArrayOfPrices[i], format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                                
                                Divider()
                                
                                TextField("Quantity", value: $ArrayOfQnt[i], format: .number)
                            }
                        }
                        
                        
                        
                    }
                }
            }
            .navigationTitle("New List")
            .toolbar {
                ToolbarItem{
                    Button{
                        
                        addList(title: title, budget: budget, articles: articles,imageName: imageName, articlesName: ArrayOfNames, articlesPrice: ArrayOfPrices, articlesQuant: ArrayOfQnt)
                        newListViewisPresented.toggle()
                        
                    }label:{
                        Text("Save")
                        
                    }
                    
                }
                
            }
        }
    }
    
    func addList(title: String, budget: Double, articles: [Article],imageName: String, articlesName: [String], articlesPrice : [Double], articlesQuant : [Double]){
        var newList = List_(title: title, budget: budget, articles: articles,imageName: imageName)
        
        for i in 0..<count{
            newList.articles.append(addArticle(name : articlesName[i], price : articlesPrice[i], quantity: articlesQuant[i]))
            
        }
        myList.lists.append(newList)
       
        
    }
    
    func addArticle(name: String,price: Double, quantity: Double) -> Article
    {
        let newArticle = Article(name: name, price: price,quantity: quantity)
        return newArticle
    }
    
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView(newListViewisPresented: .constant(true))
    }
}
