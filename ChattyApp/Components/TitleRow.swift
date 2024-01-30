//
//  TitleRow.swift
//  ChattyApp
//
//  Created by Marvis Ighedosa on 25/01/2024.
//

import SwiftUI

struct TitleRow: View {
    var imageURL = URL(string: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=3276&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Sarah Smith"
    var body: some View {
        HStack(spacing: 16){
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(48)
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.title.bold())
                    
                    HStack {
                        Text("Online")
                            .font(.caption)
                        .foregroundColor(.gray)
                        .foregroundColor(.gray)

                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundColor(.green)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "phone.fill")
                    .foregroundColor(.gray)
                    .padding()
                    .background(.white)
                    .cornerRadius(50)
            }
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}
