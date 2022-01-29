//
//  ContentView.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 27.01.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            StartView()
        }
        .navigationTitle("Conversation")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
