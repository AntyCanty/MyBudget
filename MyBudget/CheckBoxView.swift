//
//  CheckBoxModule.swift
//  MyBudget
//
//  Created by Davit Danelia on 12/13/22.
//

import SwiftUI

struct CheckBoxView: View {
    @ObservedObject var myList = listData
    @Binding var article: Article
    @State var idList : UUID

    var body: some View {
        
        Image(systemName: article.brought ? "checkmark.square.fill" : "square")
            .foregroundColor(article.brought ? Color(.purple).opacity(0.6) : Color.secondary)
            .onTapGesture {
                article.brought.toggle()
                let index = myList.lists.firstIndex(where: {$0.id == idList})
                let indexArticle = myList.lists[index!].articles.firstIndex(where: {$0.id == article.id})
                myList.lists[index!].articles[indexArticle!].brought.toggle()
//                print("is checked: " + String(article.brought) )
            }
            
    }
}


