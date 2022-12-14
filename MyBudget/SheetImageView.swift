//
//  SheetImageView.swift
//  MyBudget
//
//  Created by Antonio Bocchetti on 14/12/22.
//

import SwiftUI

struct SheetImageView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var symbols = symbolData
    @Binding var selectedImage : String
    
    
    let columns = [
        GridItem(.fixed(175)),
        GridItem(.fixed(175))
    ]
    var body: some View {
        
        //        Button("Press to dismiss") {
        //            dismiss()
        //        }
        //        .font(.title)
        //        .padding()
        //        .background(.black)
        //        }
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(symbolData.symbols, id: \.self){symbol in
                        Button() {
                            selectedImage = symbol
                            dismiss()
                        }label: {
                            Image(systemName: symbol)
                                .resizable()
                                .frame(width: 70,height: 70)
                        }
                        
                    }
                    
                    
                }.foregroundColor(.black)
            }
            .padding(.top,50)
            .navigationTitle("Select one Image")
        }
        
    }
}
struct SheetImageView_Previews: PreviewProvider {
    static var previews: some View {
        SheetImageView( selectedImage: .constant(""))
    }
}
