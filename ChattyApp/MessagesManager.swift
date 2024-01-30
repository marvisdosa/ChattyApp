//
//  MessagesManager.swift
//  ChattyApp
//
//  Created by Marvis Ighedosa on 29/01/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private (set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else {
                print("\(String(describing: error))")
                return
            }
            self.messages = document.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into message: \(error)")
                    return nil
                }
            }
            self.messages.sort(by: {$0.timestamp < $1.timestamp})
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text:String){
        do {
            let newMessage = Message( id: "\(UUID())", text: text, received: false, timestamp: Date() )
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to firestore: \(error)")
        }
    }
}
