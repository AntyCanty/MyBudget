//
//  ArticleView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 09/12/22.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var myArticle = articleData
    @State private var searchText = ""
//    @State var newArticleViewisPresented: Bool = false
    
    var body: some View {
        
        List{
            ForEach(searchResults){ article in
                
//                NavigationLink()
                HStack{
                    
                    Text(article.name)
                    
                }
            }
                
        }
    }
    
    var searchResults: [Article] {
        if searchText.isEmpty {
            return myArticle.articles
        } else {
            return myArticle.articles.filter { $0.name.contains(searchText) || $0.price.isEqual(to: Double(searchText) ?? $0.price )  }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
