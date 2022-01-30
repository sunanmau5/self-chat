//
//  AddMessageView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct AddMessageView: View {
    var onAddMessage: (_ content: String, _ isSender: Bool) -> Void
    
    @State private var content: String = ""
    @State private var isSender: Bool = true
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        List {
            HStack(spacing: 20){
                TextField("Message", text: $content)
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    if content != "" {
                        onAddMessage(content, isSender)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    IconView(iconName: "paperplane", size: 35)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            .listRowSeparator(.hidden, edges: .top)
            Toggle("Sender", isOn: $isSender)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
        .listStyle(.plain)
    }
}

struct AddMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMessageView { content, isSender in
                print(content)
                print(isSender)
            }
        }
    }
}
