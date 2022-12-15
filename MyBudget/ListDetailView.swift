
import SwiftUI

struct ListDetailView: View {
    
    @ObservedObject var myList = listData
    @State var lista : List_
    @State private var searchText = ""
    @State var newArticleViewisPresented: Bool = false
    @State var checked = true
    @State var sum : Double = 0.0;
    @State var minuSum : Double = 0.0;
    @State var sumIsDown : Bool = false;
    
    
    var body: some View {
        
        NavigationStack {
            HStack{
                //
                //                Text("B: " + String(updateBudget()) + " / " + String(lista.budget))
                //                    .multilineTextAlignment(.center)
                //                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                //                    .frame(width: 160,height: 35.0)
                //                    .background(Color(red: 0.949, green: 0.949, blue: 0.971))
                //                    .frame(width: 160, height: 40).scaledToFit().cornerRadius(15)
                //            }
                Text("S: " + String(updateBudget()) + " / B: "+String(lista.budget >= 1000 ? (String(round(10 * lista.budget/1000) / 10) + " K") : String( round(10 * lista.budget) / 10)))
                    .foregroundColor(getColorOfSpent(budget: lista.budget, totSpent: updateBudget()))
                
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .frame(width: 160,height: 35.0)
                    .background(Color(red: 0.949, green: 0.949, blue: 0.971))
                    .frame(width: 160, height: 40).scaledToFit().cornerRadius(15)
                
//                Text(String(updateBudget()))
//                    .foregroundColor(getColorOfSpent(budget: lista.budget, totSpent: updateBudget()))
//                    .multilineTextAlignment(.center)
//                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
//                    .frame(width: 160,height: 35.0)
//                    .background(Color(red: 0.949, green: 0.949, blue: 0.971))
//                    .frame(width: 160, height: 40).scaledToFit().cornerRadius(15)
//
//                Text(" / B: "+String(lista.budget >= 1000 ? (String(round(10 * lista.budget/1000) / 10) + " K") : String( round(10 * lista.budget) / 10)))
//                    .multilineTextAlignment(.center)
//                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
//                    .frame(width: 160,height: 35.0)
//                    .background(Color(red: 0.949, green: 0.949, blue: 0.971))
//                    .frame(width: 160, height: 40).scaledToFit().cornerRadius(15)

            }
            List{
                ForEach($lista.articles) {$articles in
                    
                    HStack{
                        
                        CheckBoxView(article: $articles, idList: lista.id)
                        
                        HStack(alignment: .center, spacing: 50) {
                            
                            Text(articles.name).frame(width: 60)
                                .scaledToFill()
                            Text(String(articles.price)+"$").frame(minWidth: 40)
                                .scaledToFill()
                            Text("Q: " + String(articles.quantity)).frame(minWidth: 50)
                                .scaledToFill()
                        }
                        
                    }
                }.onDelete(perform: delete)
            }
            .navigationTitle(lista.title)
            .sheet(isPresented: $newArticleViewisPresented) {
            }
            .toolbar {
                Button {
                    newArticleViewisPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
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
        lista.articles.remove(atOffsets: offsets)
    }
    
    func updateBudget() -> Double{
        var sum : Double = 0.0
        for i in lista.articles{
            if(i.brought){
                sum = sum + i.price
            }
        }
        return Double(round(10 * sum) / 10)
        
    }
    
    func getAlreadYSpend(articles : [Article] ) -> Double{
        
        var total : Double = 0
        
        for article in  articles{
            total += article.price
        }
        
        return Double(round(10 * total) / 10)
        
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
