//
//  Data.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 09/12/22.
//

import SwiftUI

class ArticleData: ObservableObject{
    
    @Published var articles = [
        Article(name: "Bread", price: 1.00, quantity: 1, weight: 0.500),
        Article(name: "Milk", price: 1.20, quantity: 0.500),
        Article(name: "Biscuits", price: 3.00, quantity: 1),
        Article(name: "Hamburger", price: 5.30, weight: 0.700),
        Article(name: "Eggs", price: 2.20,quantity: 1),
        Article(name: "Apple", price: 3.00, weight: 1),
        Article(name: "T-Shirt", price: 9.99,quantity: 1),
        Article(name: "Shorts", price: 15.00, quantity: 1),
        Article(name: "Shoes", price: 80.00, quantity: 1),
        Article(name: "Socks", price: 5.00, quantity: 2)
        
        
    ]
}

var articleData = ArticleData()

class ListData: ObservableObject{//dico che questa classe puo essere usata in altre views e                                    se cambia qualcosa devo modificare anche le altre views
    
    @Published var lists = [
        List_(title: "Grocery List", budget: 20, articles: [Article(name: "Bread", price:                                                  1.00, quantity: 1, weight: 0.500),
                                                           Article(name: "Milk", price: 1.20, quantity: 0.500),
                                                           Article(name: "Biscuits", price: 3.00, quantity: 1),
                                                           Article(name: "Hamburger", price: 5.30, weight: 0.700),
                                                           Article(name: "Eggs", price: 2.20,quantity: 1),
                                                           Article(name: "Apple", price: 3.00, weight: 1)],
                                                            imageName: "grocery"),
        
        List_(title: "Clothes List", budget: 100, articles: [        Article(name:                                                       "T-Shirt", price: 9.99,quantity: 1),
                                                                    Article(name: "Shorts", price: 15.00, quantity: 1),
                                                                    Article(name: "Shoes", price: 80.00, quantity: 1),
                                                                    Article(name: "Socks", price: 5.00, quantity: 2)],
                                                              imageName: "clothes"),
        
        List_(title: "Grocery List", budget: 20, articles: [Article(name: "Bread", price:                                                  1.00, quantity: 1, weight: 0.500),
                                                           Article(name: "Milk", price: 1.20, quantity: 0.500),
                                                           Article(name: "Biscuits", price: 3.00, quantity: 1),
                                                           Article(name: "Hamburger", price: 5.30, weight: 0.700),
                                                           Article(name: "Eggs", price: 2.20,quantity: 1),
                                                           Article(name: "Apple", price: 3.00, weight: 1)],
                                                            imageName: "grocery"),
        
        List_(title: "Clothes List", budget: 100, articles: [        Article(name:                                                       "T-Shirt", price: 9.99,quantity: 1),
                                                                    Article(name: "Shorts", price: 15.00, quantity: 1),
                                                                    Article(name: "Shoes", price: 80.00, quantity: 1),
                                                                    Article(name: "Socks", price: 5.00, quantity: 2)],
                                                              imageName: "clothes")
        

        

     

        
  ]
    
}

var listData = ListData()
