//
//  StartView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct StartView: View {
    func getUserAcronym(name: String) -> String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    private let users: [User] = [
        User(name: "Michael Jordan", color: .blue),
        User(name: "Sean King", color: .red),
        User(name: "Rich Brian", color: .teal),
        User(name: "Bradley Cooper", color: .green),
        User(name: "Steve Jobs", color: .orange),
        User(name: "John Cena", color: .gray),
    ]
    
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .padding()
                .foregroundColor(.brown)
                .shadow(color: .gray, radius: 3, x: 2 , y: 4)
            LazyVGrid(columns: twoColumnGrid, spacing: 40) {
                ForEach(users, id: \.self) { user in
                    NavigationLink(destination: ChatView(user: user)) {
                        UserPreview(acronym: getUserAcronym(name: user.name), color: user.color)
                    }
                }
            }
            .navigationTitle("Messages")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
    }
}

