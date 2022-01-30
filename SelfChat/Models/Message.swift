//
//  Message.swift
//  SelfChat
//
//  Created by Sunan Regi Maunakea on 30.01.22.
//

import Foundation

struct Message: Codable, Hashable {
    var content: String
    var isSender: Bool
}
