//
//  ChatView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct ChatView: View {
    var chatPartner: ChatPartner
    @ObservedObject var messageController: MessageController
    
    init(chatPartner: ChatPartner) {
        messageController = MessageController(chatPartner: chatPartner)
        self.chatPartner = chatPartner
    }
    
    func sendMessage(content: String, isSender: Bool) {
        messageController.create(message: Message(content: content, isSender: isSender))
    }
    
    var body: some View {
        VStack {
            ForEach(messageController.allMessages, id: \.self) { message in
                MessageView(message: message)
            }
            NavigationLink(destination: InputView { content, isSender in
                sendMessage(content: content, isSender: isSender)
            }) {
                Image(systemName: "plus.message")
            }
        }
        .navigationTitle(chatPartner.name)
        .padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(chatPartner: ChatPartner(name: "Sunan Test"))
        }
    }
}
