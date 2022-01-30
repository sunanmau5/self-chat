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
    
    func addMessage(content: String, isSender: Bool) {
        messageController.create(message: Message(content: content, isSender: isSender))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(messageController.allMessages.reversed(), id: \.self) { message in
                MessageView(message: message)
            }
            NavigationLink(destination: AddMessageView { content, isSender in
                addMessage(content: content, isSender: isSender)
            }) {
                IconView(iconName: "plus.message", size: 35)
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
