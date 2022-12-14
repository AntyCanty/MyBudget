//
//  CheckBoxModule.swift
//  MyBudget
//
//  Created by Davit Danelia on 12/13/22.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var article: Article

    var body: some View {
        
        Image(systemName: article.brought ? "checkmark.square.fill" : "square")
            .foregroundColor(article.brought ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                article.brought.toggle()
                print("is checked: " + String(article.brought) )
            }
            
    }
}


