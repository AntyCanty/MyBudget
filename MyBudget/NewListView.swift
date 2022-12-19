//
//  NewListView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 10/12/22.
//

import SwiftUI

struct NewListView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var myList = listData
    @ObservedObject var myArticle = articleData
    
    @State var title: String = ""
    @State var budget: Double = 0
    @State var articles : [Article] =  []
    @State var imageName : String = ""
    @State var count : Int = 1
    @State var ArrayOfNames : [String] = [""]
    @State var ArrayOfPrices : [Double] = [0]
    @State var ArrayOfQnt : [Double] = [1]
    @State var selectedImage : String = symbolData.symbols[0]
    @State var checkDelete : Bool = false
    @State private var showingSheet = false
    
    @State var isNew : Bool = true
    @State var idList : UUID = listData.lists[0].id
    
    @Binding var newListViewisPresented : Bool
    
    
    var body: some View {
        
        NavigationStack{
            ScrollViewReader { p in
                Form{
            
                    Section(header: Text("Image")){
                        Button() {
                                   showingSheet.toggle()
                        }label: {
                            
                            Image(systemName: selectedImage)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.black)
                        }
                               .sheet(isPresented: $showingSheet) {
                                   SheetImageView(selectedImage: $selectedImage)
                               }
                       
                      
                    }
                    
                    Section(header: Text("Title")){
                        TextField("title", text: $title)
                    }
                    Section(header: Text("Budget")){
                        TextField("budget", value: $budget, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                    }
                    Section(header: Text("Articles")){
                        HStack{
                            Spacer()
                            Button{
                                ArrayOfNames.append("")
                                ArrayOfPrices.append(0)
                                ArrayOfQnt.append(1)
                                
                                count+=1
                                checkDelete = true
                                print(count)
                            }label:{Image(systemName: "plus")}
                            
                        }
                        
                        List {
                            ForEach(0..<count,id: \.self) { i in
                                
                                
                                HStack{
                                    TextField("Name", text:$ArrayOfNames[i])
                                    
                                    Divider()
                                    
                                    
                                    TextField("Price",  value: $ArrayOfPrices[i], format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .keyboardType(.decimalPad)
                                    
                                    Divider()
                                    
                                    TextField("Quantity", value: $ArrayOfQnt[i], format: .number)
                                        .keyboardType(.decimalPad)
                                }
                            }.onDelete( perform: delete)
                                .deleteDisabled(!checkDelete)
                            
                        }
                    }
                }
            }
            .navigationTitle( isNew ? "New List"  : "Modify List")
            .toolbar {
                ToolbarItem{
                    Button{
                        
                        if(isNew){
                            addList(title: title, budget: budget, articles: articles,imageName: selectedImage, articlesName: ArrayOfNames, articlesPrice: ArrayOfPrices, articlesQuant: ArrayOfQnt)
                            newListViewisPresented.toggle()
                        }else{
                            updateList(title: title, budget: budget, articles: articles,imageName: selectedImage, articlesName: ArrayOfNames, articlesPrice: ArrayOfPrices, articlesQuant: ArrayOfQnt)
                            dismiss()
                        }
                       
                        
                    }label:{
                        Text("Save")
                        
                    }
                    
                }
                
            }
            .onDisappear{
                if(!isNew){
                    newListViewisPresented.toggle()
                }
            }
            .onAppear{
                fillField()
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
    
    func updateList(title: String, budget: Double, articles: [Article],imageName: String, articlesName: [String], articlesPrice : [Double], articlesQuant : [Double]){
       
        let indexList = myList.lists.firstIndex(where: {$0.id == idList})
        
                
        var newList = List_(title: title, budget: budget, articles: articles,imageName: imageName)
        newList.id = myList.lists[indexList!].id
        newList.articles.removeAll()
        for i in 0..<count{
            newList.articles.append(addArticle(name : articlesName[i], price : articlesPrice[i], quantity: articlesQuant[i]))
            
        }
        myList.lists[indexList!].articles.removeAll()
        myList.lists[indexList!] = newList
        
        
    }
    
    func fillField(){

        if(!isNew){
            
            let indexList = myList.lists.firstIndex(where: {$0.id == idList})
            
            self.title = myList.lists[indexList!].title
            self.budget = myList.lists[indexList!].budget
            self.imageName = myList.lists[indexList!].imageName
            self.articles = myList.lists[indexList!].articles
            for i in 0..<articles.count{
                
                if(i==0){
                    self.ArrayOfNames[i] = articles[i].name
                    self.ArrayOfPrices[i] = articles[i].price
                    self.ArrayOfQnt[i] = articles[i].quantity
                    count = 0
                }else{
                    self.ArrayOfNames.append(articles[i].name)
                    self.ArrayOfPrices.append(articles[i].price)
                    self.ArrayOfQnt.append(articles[i].quantity)
                }
                count += 1
            }
            if(count != 1){
                checkDelete = true
            }
        }
        
    }
    
    func delete(at offsets: IndexSet){
        if(count != 1){
            ArrayOfQnt.remove(atOffsets: offsets)
            ArrayOfPrices.remove(atOffsets: offsets)
            ArrayOfNames.remove(atOffsets: offsets)
            
            count -= 1
            if(count == 1){
                checkDelete = false
            }
        }
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView(newListViewisPresented: .constant(true))
    }
}
