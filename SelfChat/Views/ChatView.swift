//
//  ChatView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct ChatView: View {
    var user: String
    
    var body: some View {
        NavigationLink(destination: InputView()) {
            Text("Write a message to \(user)")
        }
        .navigationTitle(user)
        
    }
}
