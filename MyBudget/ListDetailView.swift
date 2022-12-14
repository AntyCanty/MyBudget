
import SwiftUI

struct ListDetailView: View {
    
    @EnvironmentObject var myList : ListData
    @State var lista : List_
    @State private var searchText = ""
    @State var newLearnerViewisPresented: Bool = false
    @State var checked = true
    @State var sum : Double = 0.0;
    @State var minuSum : Double = 0.0;
    @State var sumIsDown : Bool = false;
    
    
    var body: some View {
        
        NavigationStack {
            HStack{
                Text("B: " + String(round(sum * 1000) / 1000.0) + " / " + String(minuSum))
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .frame(width: 160,height: 35.0)
                    .background(Color(red: 0.949, green: 0.949, blue: 0.971))
            }.frame(width: 160, height: 40).scaledToFit().cornerRadius(15)
            List{
                ForEach($lista.articles) {$articles in
                    
                    HStack{
                        
                        CheckBoxView(article: $articles, idList: lista.id)
                        
                        HStack(alignment: .center, spacing: 50) {
                            
                            Text(articles.name).frame(width: 60)
                            Text(String(articles.price)+"$").frame(minWidth: 40)
                            Text("Q: " + String(articles.quantity)).frame(minWidth: 50)
                        }.onAppear{ if(!sumIsDown){
                            sum = sum + Double(articles.price)
                            if(articles.id == lista.articles.first?.id) {
                                sumIsDown.toggle()
                            }
                            if(articles.brought == true){
                                minuSum = minuSum + Double(articles.price)
                            }
                        }
                        }.frame(width: 30).frame(maxWidth: .infinity)
                    }
                }.onDelete(perform: delete)
            }
            .navigationTitle("Grocery List")
            .sheet(isPresented: $newLearnerViewisPresented) {
                //                NewLearnerView(newLearnerViewisPresented: $newLearnerViewisPresented)
            }
            .toolbar {
                Button {
                    newLearnerViewisPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
        }
        .searchable(text: $searchText)
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
    
    //    func editLearner(item: Items) {
    //        let newLearner = Learner(name: name, surname: surname, favouriteColor: favouriteColor, description: description)
    //        myData.learners.append(newLearner)
    //    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(lista: listData.lists[0])
    }
}
