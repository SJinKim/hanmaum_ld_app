//
//  CustomButton.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 03.06.24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                    .frame(width: 100)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    CustomButton(title: "Value", background: .pink) {
        // Action
        
    }
}
