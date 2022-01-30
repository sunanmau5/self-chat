//
//  MessageView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 30.01.22.
//

import SwiftUI

struct MessageView : View {
    var message: Message
    
    var body: some View {
        ContentMessageView(message: message)
            .padding(!message.isSender ? .leading : .trailing , 15)
            .padding(message.isSender ? .leading : .trailing , 60)
            .frame(width: UIScreen.main.bounds.width, alignment: !message.isSender ? .leading : .trailing)
    }
}

struct ContentMessageView: View {
    var message: Message
    
    var body: some View {
        Text(message.content)
            .padding(10)
            .foregroundColor(message.isSender ? Color.white : Color.black)
            .background(message.isSender ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(17)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let messages = [
            Message(content: "Hello Darkness my old friend. Long time no see :)", isSender: true),
            Message(content: "Hello Darkness my old friend. Long time no see too", isSender: false),
            Message(content: "Hello Darkness my old friend", isSender: true),
        ]
        
        VStack {
            ForEach(messages, id: \.self) { message in
                MessageView(message: message)
            }
        }
    }
}
