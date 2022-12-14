
import SwiftUI

struct ListDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var myList = listData
    @State var lista : List_
    @State private var searchText = ""
    @State var newArticleViewisPresented: Bool = false
    @State var sum : Double = 0.0;
    
    @State var isActive : Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            NavigationLink(destination: NewListView(isNew: false, idList: lista.id, newListViewisPresented: $isActive), isActive: $isActive) { EmptyView() }
            HStack{

                Text("Spent: " + String(updateBudget()) + " / Budget: "+String(lista.budget >= 1000 ? (String(round(10 * lista.budget/1000) / 10) + "K $") : String( round(10 * lista.budget) / 10)))
                    .foregroundColor(getColorOfSpent(budget: lista.budget, totSpent: updateBudget()))

                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .frame(width: 300,height: 35.0)
                    .background(Color(red: 0.949, green: 0.949, blue: 0.971))
                    .frame(width: 300, height: 40).scaledToFit().cornerRadius(15)

            }
            List{
                ForEach($lista.articles) {$articles in
                    
                    HStack{
                        
                        CheckBoxView(article: $articles, idList: lista.id)
                        
                        NavigationLink(destination: NewArticleView(newArticleViewisPresented: $newArticleViewisPresented,isNew : false, idArticle : articles.id , idList: lista.id)){
                            HStack(alignment: .center, spacing: 50) {
                                
                                Text(articles.name).frame(width: 60)
                                    .scaledToFill()
                                Text(String(articles.price)+"$").frame(minWidth: 40)
                                    .scaledToFill()
                                Text("Q: " + String(articles.quantity)).frame(minWidth: 50)
                                    .scaledToFill()
                            }
                            
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(lista.title)
            .sheet(isPresented: $newArticleViewisPresented, onDismiss: {
                let index = myList.lists.firstIndex(where: {$0.id == lista.id})
                lista =  myList.lists[index!]
            }) {
                NewArticleView(newArticleViewisPresented: $newArticleViewisPresented, isNew: true, idList: lista.id)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button{
                            setAsFavourite(idList:lista.id)
                        } label: {
                            if(!lista.favourite){
                                Label("Add list to faves",systemImage: "star")
                            }
                            else{
                                Label("Remove list from faves",systemImage: "star.fill")
                            }
                        }
                        Button{
                            isActive.toggle()
                        }label: {
                            Label("Modify List", systemImage: "pencil")
                        }
                        Button {
                            newArticleViewisPresented.toggle()
                        } label: {
                            Label("Add article",systemImage: "plus")
                        }
                        Button {
                            deleteList(idList:lista.id)
                            dismiss()
                            
                        } label: {
                            Label("Delete list",systemImage: "trash")
                        }
                        
                    }, label: {Image(systemName: "ellipsis.circle")})
                    
                    
                }
                
            }
            
            
        }
        .onAppear{
            let index = myList.lists.firstIndex(where: {$0.id == lista.id})
            lista =  myList.lists[index!]
        }
    }
    
    var searchResults: [Article] {
        if searchText.isEmpty {
            return lista.articles
        } else {
            return lista.articles.filter { $0.name.contains(searchText) }
        }
    }
    
    func delete(at offsets: IndexSet){
        let index = myList.lists.firstIndex(where: {$0.id == lista.id})
        
        myList.lists[index!].articles.remove(atOffsets: offsets)
        lista.articles.remove(atOffsets: offsets)
        
    }
    
    func deleteList(idList : UUID){
        let index = myList.lists.firstIndex(where: {$0.id == idList})
        myList.lists.remove(at: index!)
    }
    
    func setAsFavourite(idList : UUID){
        
        lista.favourite.toggle()
        let index = myList.lists.firstIndex(where: {$0.id == idList})
        myList.lists[index!].favourite.toggle()
        
    }
    
    func updateBudget() -> Double{
        var sum : Double = 0.0
        for i in lista.articles{
            if(i.brought){
                sum = sum + (i.price * i.quantity)
            }
        }
        return Double(round(10 * sum) / 10)
        
    }
    
    
    func getColorOfSpent(budget: Double, totSpent : Double) -> Color{
        
        if(totSpent < budget/2){
            return Color.green
        }
        else if(totSpent >= budget/2 && totSpent<budget){
            return Color.orange
        }
        else{
            return Color.red
        }
        
    }
}



struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(lista: listData.lists[0])
    }
}
