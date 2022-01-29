//
//  UserPreview.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct UserPreview: View {
    var acronym: String
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.white, lineWidth: 10)
                .background(Circle().fill(color))
            Text(acronym)
                .foregroundColor(.white)
                .font(.system(size: 40))
        }
        .frame(width: 120, height: 120)
    }
}

struct UserPreview_Previews: PreviewProvider {
    static var previews: some View {
        UserPreview(acronym: "MJ", color: .blue)
    }
}
