//
//  NoticeBoardView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 03.06.24.
//

import SwiftUI

struct NoticeBoardView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Notice Board")
                VStack {
                    NavigationLink("Create new Text", destination: EntryView())
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    NoticeBoardView()
}
