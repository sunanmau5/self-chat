//
//  MessageController.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 30.01.22.
//

import Foundation

class MessageController: ObservableObject {
    
    private let dataSourceURL: URL
    @Published var allMessages = [Message]()
    var currentChatPartner = ""
    
    init(chatPartner: ChatPartner) {
        currentChatPartner = chatPartner.name
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let messagesPath = documentsPath.appendingPathComponent(currentChatPartner).appendingPathComponent("json")
        dataSourceURL = messagesPath
        
        _allMessages = Published(wrappedValue: getAllMessages())
    }
    
    private func getAllMessages() -> [Message] {
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: dataSourceURL)
            let decodedMessages = try! decoder.decode([Message].self, from: data)
            return decodedMessages
        } catch {
            return []
        }
    }
    
    private func saveMessages() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(allMessages)
            try data.write(to: dataSourceURL)
        } catch {
            
        }
    }
    
    func create(message: Message) {
        allMessages.insert(message, at: 0)
        saveMessages()
    }
}
