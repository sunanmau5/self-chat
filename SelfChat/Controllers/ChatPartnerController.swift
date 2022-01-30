//
//  UserController.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 30.01.22.
//

import Foundation

class ChatPartnerController: ObservableObject {
    
    static let shared = ChatPartnerController()
    private let dataSourceURL: URL
    @Published var allChatPartners = [ChatPartner]()
    
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let chatPartnerPath = documentsPath.appendingPathComponent("chat-partner").appendingPathComponent("json")
        dataSourceURL = chatPartnerPath
        
        _allChatPartners = Published(wrappedValue: getAllChatPartners())
    }
    
    private func getAllChatPartners() -> [ChatPartner] {
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: dataSourceURL)
            let decodedChatPartners = try! decoder.decode([ChatPartner].self, from: data)
            return decodedChatPartners
        } catch {
            return []
        }
    }
    
    private func saveChatPartners() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(allChatPartners)
            try data.write(to: dataSourceURL)
        } catch {
            
        }
    }
    
    func addChatPartner(name: String) {
        let chatPartner = ChatPartner(name: name)
        allChatPartners.insert(chatPartner, at: 0)
        saveChatPartners()
    }
}
