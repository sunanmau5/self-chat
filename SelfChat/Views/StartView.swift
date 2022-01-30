//
//  StartView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var chatPartners = ChatPartnerController.shared
    private let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .shadow(color: .gray, radius: 3, x: 2 , y: 4)
            VStack {
                LazyVGrid(columns: twoColumnGrid, spacing: 40) {
                    ForEach(chatPartners.allChatPartners, id: \.self) { chatPartner in
                        NavigationLink(destination: ChatView(chatPartner: chatPartner)) {
                            ChatPartnerView(chatPartner: chatPartner)
                        }
                    }
                }
                .frame(minWidth: 0, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: 20)
                AddChatPartnerView()
            }
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

