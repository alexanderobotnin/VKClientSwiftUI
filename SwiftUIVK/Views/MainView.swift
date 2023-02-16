//
//  MainView.swift
//  SwiftUIVK
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FriendsView()
                .padding()
                .tabItem {
                    Label("Friends", systemImage: "person.3")
                }
                .tag(1)
            
            GroupsView()
                .padding()
                .tabItem {
                    Label("Groups", systemImage: "squares.below.rectangle")
                }
                .tag(2)
            
            NewsView()
                .padding()
                .tabItem {
                    Label("News", systemImage: "list.bullet")
                        .tag(3)
                }
        }.navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
