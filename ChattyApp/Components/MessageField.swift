//
//  MessageField.swift
//  ChattyApp
//
//  Created by Marvis Ighedosa on 26/01/2024.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter Your message here").bold(), text: $message)
            
            Button {
                messagesManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(.gray.opacity(0.08))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField().environmentObject(MessagesManager())
    }
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text:String
    var editingChanged:(Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body:some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
