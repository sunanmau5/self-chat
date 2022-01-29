//
//  ChatView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct ChatView: View {
    var user: User
    
    var body: some View {
        NavigationLink(destination: InputView()) {
            Image(systemName: "plus.message")
        }
        .navigationTitle(user.name)
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(user: User(name: "Sunan Test", color: .red))
        }
    }
}
