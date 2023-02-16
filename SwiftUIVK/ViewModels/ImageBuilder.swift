//
//  ImageBuilder.swift
//  SwiftUIVK
//


import SwiftUI

struct ImageBuilder: View {
    @State var isScaleChanged: Bool = false
    
    let content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    var body: some View {
            content
                .resizable()
                .frame(width: 50, height: 50)
                .modifier(ImageModifier(imageCornerRadius: 40, shadowColor: .black, shadowRadius: 5, x: 3, y: 3))
//                .scaleEffect(isScaleChanged ? 1.2 : 1)
//                .animation(.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 0.8))
//                .onTapGesture {
//                    isScaleChanged.toggle()
//                }
        }
}
