//
//  ChattyAppApp.swift
//  ChattyApp
//
//  Created by Marvis Ighedosa on 25/01/2024.
//

import SwiftUI
import Firebase

@main
struct ChattyAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
