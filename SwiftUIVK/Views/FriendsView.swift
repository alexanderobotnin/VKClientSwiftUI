//
//  FriendsView.swift
//  SwiftUIVK
//

import SwiftUI
import SystemConfiguration

struct FriendsView: View {
    
    @ObservedObject var session = SessionSingletone.shared
    
    @State private var shouldShowPhotoCollection = false
    
    private var APIRequest = VKAPIService()
    
    var body: some View {
        
        NavigationView {
            List(session.friends) { friend in
                FriendCell(friend: friend, isPhotoButtonSelected: $shouldShowPhotoCollection)
            }.navigationBarTitle(Text("Friends"))
            
            
            NavigationLink(destination: PhotoCollectionView(), isActive: $shouldShowPhotoCollection) {
                EmptyView()
            }
        }
        
//MARK: Проверка работоспособности запроса
        
        .onAppear {
          APIRequest.friendsListRequest()
        }
        
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}



