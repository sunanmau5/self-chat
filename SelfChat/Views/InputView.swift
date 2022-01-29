//
//  InputView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 29.01.22.
//

import SwiftUI

struct InputView: View {
    @State private var message: String = ""
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        HStack{
            TextField("Message", text: $message)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "paperplane")
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InputView()
        }
    }
}
