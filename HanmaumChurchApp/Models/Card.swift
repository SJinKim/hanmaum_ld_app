//
//  Card.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 14.06.24.
//

import Foundation
import SwiftUI

struct Card {
    let id = UUID()
    let colors: [Color] = [.red, .blue, .yellow, .orange, .green, .purple, .cyan, .mint, .pink]
    let news: [String] =  ["Hi news1", "news2", "news3", "news4", "news5", "news6", "news7", "news8", "news9"]
}
