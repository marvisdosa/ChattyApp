//
//  Message.swift
//  ChattyApp
//
//  Created by Marvis Ighedosa on 25/01/2024.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp:Date
}
