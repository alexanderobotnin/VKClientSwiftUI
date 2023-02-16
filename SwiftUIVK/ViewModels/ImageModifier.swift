//
//  ImageModifier.swift
//  SwiftUIVK
//


import SwiftUI

struct ImageModifier: ViewModifier {
    let imageCornerRadius: CGFloat
    let shadowColor: Color
    let shadowRadius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(imageCornerRadius)
            .background(Circle()
                            .fill(Color.white)
                            .shadow(color: shadowColor, radius: shadowRadius, x: x, y: y))
    }
}
