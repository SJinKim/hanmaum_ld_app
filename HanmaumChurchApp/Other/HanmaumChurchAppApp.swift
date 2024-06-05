//
//  HanmaumChurchAppApp.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 02.06.24.
//

import SwiftUI
import FirebaseCore

@main
struct HanmaumChurchAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
