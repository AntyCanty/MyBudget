//
//  firendsdetail.swift
//  BananaTeam
//
//  Created by Karan Oroumchi on 11/12/22.
//

import SwiftUI

struct FriendsDetail: View {
    @ObservedObject var myData = friendsData
    var friends : Friends
    
    var body: some View {
        ZStack {
            friends.favoritecolor
                .ignoresSafeArea()
                .opacity(0.2)
        
        
            VStack {
                Image(friends.imagename)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 280, height: 280)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                
                HStack {
                    Text(friends.name + " " + friends.surname)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
                .foregroundColor(friends.favoritecolor)
                Text(friends.phonenumber)
            }
        }
    }
}
struct firendsdetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendsDetail(friends: friendsData.friends[1])
    }
}
