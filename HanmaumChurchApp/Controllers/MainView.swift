//
//  ContentView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 02.06.24.
//

import SwiftUI

struct MainView: View {
    // user signed in?
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        //signed in
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Todo", systemImage: "pencil.and.list.clipboard")
                }
            NoticeBoardView()
                .tabItem {
                    Label("Board", systemImage: "note")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
