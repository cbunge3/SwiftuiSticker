// DragStickerMotionEffect.swift
// Sticker
//
// Created by Benjamin Pisano on 13/11/2024.
//
import SwiftUI


public struct DragStickerMotionEffect: StickerMotionEffect {
    let intensity: Double
    let isDragEnabled: Bool
    @State private var transform: StickerTransform = .neutral
    @Environment(\.stickerShaderUpdater) private var shaderUpdater
    
    public func body(content: Content) -> some View {
        content
            .withViewSize { view, size in
                let xRotation: Double = (transform.x / size.width) * intensity
                let yRotation: Double = (transform.y / size.height) * intensity
                view
                    .rotation3DEffect(.radians(xRotation), axis: (0, 1, 0))
                    .rotation3DEffect(.radians(yRotation), axis: (-1, 0, 0))
                    .applyIf(isDragEnabled) {
                        $0.gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let deltaX = gesture.translation.width
                                    let deltaY = gesture.translation.height
                                    let newTransform = StickerTransform(
                                        x: deltaX,
                                        y: deltaY
                                    )
                                    transform = newTransform
                                    shaderUpdater.update(with: newTransform)
                                }
                                .onEnded { _ in
                                    withAnimation(.interactiveSpring(response: 0.25, dampingFraction: 0.75, blendDuration: 0)) {
                                        transform = .neutral
                                        shaderUpdater.setNeutral()
                                    }
                                }
                        )
                    }
            }
    }
}
public extension StickerMotionEffect where Self == DragStickerMotionEffect {
    static var dragGesture: Self {
        .dragGesture()
    }
   
    static func dragGesture(intensity: Double = 1, isDragEnabled: Bool = true) -> Self {
        .init(intensity: intensity, isDragEnabled: isDragEnabled)
    }
}
