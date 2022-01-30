//
//  InputView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct InputView: View {
    var onSendMessage: (_ content: String, _ isSender: Bool) -> Void
    
    @State private var content: String = ""
    @State private var isSender: Bool = true
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            HStack{
                TextField("Message", text: $content)
                Button {
                    if content != "" {
                        onSendMessage(content, isSender)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: "paperplane")
                        .clipShape(Circle())
                }
            }
            Toggle("Sender", isOn: $isSender)
        }
        .padding()
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InputView { content, isSender in
                print(content)
                print(isSender)     
            }
        }
    }
}
