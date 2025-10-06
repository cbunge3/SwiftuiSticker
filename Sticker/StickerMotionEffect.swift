//
//  StickerMotionEffect.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//



//
import SwiftUI
public protocol StickerMotionEffect: ViewModifier { }
extension View {
    func applyTransform(for effect: some StickerMotionEffect) -> AnyView {
        AnyView(modifier(effect))
    }
    public func stickerMotionEffect(_ effect: some StickerMotionEffect) -> some View {
        environment(\.stickerMotionEffect, effect)
    }
}
public extension EnvironmentValues {
    @Entry var stickerMotionEffect: any StickerMotionEffect = IdentityStickerMotionEffect()
}

struct IdentityStickerMotionEffect: StickerMotionEffect {
    func body(content: Content) -> some View {
        content
    }
}
