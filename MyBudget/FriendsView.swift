//
//  friendsview.swift
//  BananaTeam
//
//  Created by Karan Oroumchi on 11/12/22.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject var myData = friendsData
    @State
    var searchtext = ""
    private var selectedIndex: Int?
    @State var NewFriendViewisPresented: Bool = false
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(searchResults) {friends in
                    NavigationLink(destination: FriendsDetail(friends: friends)) {
                        HStack{
                            Image(systemName: "person.fill").foregroundColor(friends.favoritecolor)
                            Text(friends.name + " " + friends.surname)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Friends")
            .searchable(text: $searchtext)
            .sheet(isPresented: $NewFriendViewisPresented) {
                NewFriendsView(NewFriendViewisPresented: $NewFriendViewisPresented)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        NewFriendViewisPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    var searchResults: [Friends] {
        if searchtext.isEmpty {
            return myData.friends
        } else {
            return myData.friends.filter { $0.name.contains(searchtext) || $0.surname.contains(searchtext)  }
        }
    }
    func delete(at offsets: IndexSet) {
        myData.friends.remove(atOffsets: offsets)
    }
    struct friendsview_Previews: PreviewProvider {
        static var previews: some View {
            FriendsView()
        }
    }
}
