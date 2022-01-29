//
//  StartView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct StartView: View {
    var users = [
        "Michael Jordan",
        "Sean King",
        "Rich Brian",
        "Bradley Cooper",
        "Steve Jobs"
    ]
    var body: some View {
        List(users, id: \.self) { entry in
            NavigationLink(destination: ChatView(user: entry)) {
                Text(entry)
            }
        }
        .navigationTitle("Messages")
    }
}
