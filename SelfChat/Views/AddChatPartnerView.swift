//
//  AddChatPartnerView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 30.01.22.
//

import SwiftUI

struct AddChatPartnerView: View {
    @State var name: String = ""
    @ObservedObject var chatPartners = ChatPartnerController.shared
    
    var body: some View {
        HStack(spacing: 20) {
            TextField("New Chat Partner", text: $name)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                if name != "" {
                    chatPartners.addChatPartner(name: name)
                    name = ""
                }
            } label: {
                IconView(iconName: "plus", size: 35)
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct AddChatPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        AddChatPartnerView()
    }
}
