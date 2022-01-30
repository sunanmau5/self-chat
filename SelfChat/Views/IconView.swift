//
//  IconView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 30.01.22.
//

import SwiftUI

struct IconView: View {
    var iconName: String
    var size: CGFloat
    
    var body: some View {
        Image(systemName: iconName)
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(.blue)
                    .frame(width: size, height: size)
            )
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(iconName: "paperplane", size: 35)
    }
}
