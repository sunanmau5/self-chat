//
//  StartView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct StartView: View {    
    private let chatPartners: [ChatPartner] = [
        ChatPartner(name: "Michael Jordan"),
        ChatPartner(name: "Sean King"),
        ChatPartner(name: "Rich Brian"),
        ChatPartner(name: "Bradley Cooper"),
        ChatPartner(name: "Steve Jobs"),
        ChatPartner(name: "John Cena"),
    ]
    
    private let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .shadow(color: .gray, radius: 3, x: 2 , y: 4)
            LazyVGrid(columns: twoColumnGrid, spacing: 40) {
                ForEach(chatPartners, id: \.self) { chatPartner in
                    NavigationLink(destination: ChatView(chatPartner: chatPartner)) {
                        ChatPartnerView(chatPartner: chatPartner)
                    }
                }
            }
            .frame(minWidth: 0, maxHeight: .infinity, alignment: .topLeading)
            .offset(y: 20)
        }
        .navigationTitle("Messages")
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
    }
}

