//
//  ContentView.swift
//  SwiftUIVK
//


import SwiftUI

struct ContentView: View {
    
@ObservedObject private var session = SessionSingletone.shared
    
    var body: some View {
        NavigationView {
            HStack {
                ServerLoginVKView()
                NavigationLink(destination: MainView(), isActive: $session.logedIn) {
                    EmptyView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
