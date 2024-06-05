//
//  EntryView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 03.06.24.
//

import SwiftUI

struct EntryView: View {
    @State private var text: String = ""
    @State private var note = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Form {
                TextField("Title", text: $text)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $note)
                        .focused($isFocused)
                    if !isFocused && note.isEmpty {
                        Text("Enter Text here")
                            .foregroundStyle(Color(uiColor: .placeholderText))
                            .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    }
                }
                .frame(height: 300)
                CustomButton(title: "Submit", background: .green) {
                    // submitting
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    EntryView()
}
