//
//  Model.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 09/12/22.
//

import SwiftUI

//Creiamo il model per un generico articolo
struct Article: Identifiable {//Identifica l'oggetto come UNICO
    var id = UUID()
    var name: String
    var price: Double
    var quantity : Double = 1
    var weight : Double = 0
}

//Creiamo il model per una generica lista
struct List_: Identifiable {//Identifica l'oggetto come UNICO
    var id = UUID()
    var title: String
    var budget: Double
    var articles : [Article]
    var imageName : String = ""
}
