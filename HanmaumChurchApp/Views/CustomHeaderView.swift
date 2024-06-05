//
//  HeaderView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 03.06.24.
//

import SwiftUI

struct CustomHeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    CustomHeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
