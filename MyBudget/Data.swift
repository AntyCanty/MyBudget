//
//  Data.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 09/12/22.
//

import SwiftUI

class ArticleData: ObservableObject{
    
    @Published var articles = [
        Article(name: "Bread", price: 1.00, quantity: 1),
        Article(name: "Milk", price: 1.20, quantity: 0.500),
        Article(name: "Biscuits", price: 3.00, quantity: 1),
        Article(name: "Hamburger", price: 5.30),
        Article(name: "Eggs", price: 2.20,quantity: 1),
        Article(name: "Apple", price: 3.00),
        Article(name: "T-Shirt", price: 9.99,quantity: 1),
        Article(name: "Shorts", price: 15.00, quantity: 1),
        Article(name: "Shoes", price: 80.00, quantity: 1),
        Article(name: "Socks", price: 5.00, quantity: 2)
        
        
    ]
}

var articleData = ArticleData()

class ListData: ObservableObject{//dico che questa classe puo essere usata in altre views e                                    se cambia qualcosa devo modificare anche le altre views
    
    @Published var lists = [
        List_(title: "Grocery List", budget: 20, articles: [Article(name: "Bread", price:                                                  1.00, quantity: 1, weight: 0.500, brought: false),
                                                            Article(name: "Milk", price: 1.20, quantity: 0.500, brought: false),
                                                            Article(name: "Biscuits", price: 3.10, quantity: 1, brought: true),
                                                            Article(name: "Cream", price: 5.30, weight: 0.700, brought: false),
                                                            Article(name: "Eggs", price: 2.20,quantity: 1, brought: true),
                                                            Article(name: "Apple", price: 3.00, weight: 1, brought: false)],
              imageName: symbolData.symbols[0]),
        
        List_(title: "Clothes List", budget: 100, articles: [        Article(name:                                                       "T-Shirt", price: 9.99,quantity: 1),
                                                                     Article(name: "Shorts", price: 15.00, quantity: 1, brought: false),
                                                                     Article(name: "Shoes", price: 80.00, quantity: 1, brought: false),
                                                                     Article(name: "Socks", price: 5.00, quantity: 2, brought: false)],
              imageName: symbolData.symbols[2])
        
    ]
}
var listData = ListData()

class FriendsData: ObservableObject {
    
    @Published var friends = [
        Friends (name: "John", surname: "Doe", favoritecolor: .mint, phonenumber: "999-111-999", imagename: "1"),
        Friends (name: "Kohn", surname: "Loe", favoritecolor: .black, phonenumber: "999-111-999", imagename: "2"),
        Friends (name: "Lohn", surname: "Koe", favoritecolor: .red, phonenumber: "999-111-999", imagename: "3"),
        Friends (name: "Rohn", surname: "Foe", favoritecolor: .purple, phonenumber: "999-111-999", imagename: "4"),
        Friends (name: "Wohn", surname: "Soe", favoritecolor: .mint, phonenumber: "999-111-999", imagename: "5"),
        Friends (name: "Qohn", surname: "Zoe", favoritecolor: .orange, phonenumber: "999-111-999", imagename: "6"),
        Friends (name: "John", surname: "Doe", favoritecolor: .mint, phonenumber: "999-111-999", imagename: "7"),
        Friends (name: "Kohn", surname: "Loe", favoritecolor: .black, phonenumber: "999-111-999", imagename: "8"),
        Friends (name: "Lohn", surname: "Koe", favoritecolor: .red, phonenumber: "999-111-999", imagename: "9"),
        Friends (name: "Rohn", surname: "Foe", favoritecolor: .purple, phonenumber: "999-111-999", imagename: "10"),
    ]
}

var friendsData = FriendsData()

class SymbolData : ObservableObject{
    
    @Published var symbols : [String] = ["cart.fill", "book.closed.fill","tshirt.fill","figure.run.circle.fill","backpack.circle",  "doc.fill"]
    
    
}

var symbolData = SymbolData()

