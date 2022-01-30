//
//  ChatPartnerView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct ChatPartnerView: View {
    var chatPartner: ChatPartner
    
    func getAcronym (name: String) -> String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    func getRandomColor () -> Color {
        let colors: [Color] = [
            .red,
            .orange,
            .yellow,
            .green,
            .mint,
            .teal,
            .cyan,
            .blue,
            .indigo,
            .purple,
            .pink,
            .brown
        ]
        return colors[Int.random(in: 0..<colors.count)]
    }
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.white, lineWidth: 10)
                .background(Circle().fill(getRandomColor()))
            Text(getAcronym(name:chatPartner.name))
                .foregroundColor(.white)
                .font(.system(size: 40))
        }
        .frame(width: 120, height: 120)
    }
}

struct ChatPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        ChatPartnerView(chatPartner: ChatPartner(name: "Michael Jordan"))
    }
}
