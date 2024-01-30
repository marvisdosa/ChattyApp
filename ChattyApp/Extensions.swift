//
//  Extensions.swift
//  ChattyApp
//
//  Created by Marvis Ighedosa on 26/01/2024.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius:CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius , corners: corners))
    }
}

//Custom RoundedCOrner shape for CornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
