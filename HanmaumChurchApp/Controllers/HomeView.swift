//
//  HomeView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 03.06.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("LD News")
                    .bold()
                    .padding()
                ScrollingCarouselView()
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    HomeView()
}
