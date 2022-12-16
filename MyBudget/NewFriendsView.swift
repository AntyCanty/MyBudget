//
//  newfriendsview.swift
//  BananaTeam
//
//  Created by Karan Oroumchi on 11/12/22.
//

import SwiftUI

struct NewFriendsView: View {
    @ObservedObject var myData = friendsData
    @State var name: String = ""
    @State var surname: String = ""
    @State var phonenumber: String = ""
    @State var color: Color = Color.white
    @State var text = ""
    
    @Binding var NewFriendViewisPresented : Bool
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section(header: Text("name")) {
                    TextField("Type name", text: $name)
                }
                Section(header: Text("surname")) {
                    TextField("Type surname", text: $surname)
                }
                Section(header: Text("phone number")) {
                    TextField("Type phone number", text:$phonenumber)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("color")) {
                    ColorPicker("Choose color", selection: $color)
                }
                
            }
            .navigationTitle("New Friend")
            .toolbar {
                ToolbarItem {
                    Button {
                        
                        addfriend(name: name, surname: surname, phonenumber: phonenumber,color: color)
                        NewFriendViewisPresented.toggle()
                        
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
    func addfriend(name:String, surname: String, phonenumber:String, color: Color){
        let newfriend = Friends(name: name,
                                 surname: surname,
                                 favoritecolor: color,
                                 phonenumber: phonenumber)
        myData.friends.append(newfriend)
    }
}

struct newfriendsview_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendsView(NewFriendViewisPresented: .constant(true))
    }
}
