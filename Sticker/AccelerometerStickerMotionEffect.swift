//
//  AccelerometerStickerMotionEffect.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//


#if os(iOS)
import SwiftUI
import CoreMotion
public struct AccelerometerStickerMotionEffect: StickerMotionEffect {
    let intensity: Double
    let maxRotation: Angle
    let updateInterval: TimeInterval
    @Environment(\.stickerShaderUpdater) private var shaderUpdater
    public func body(content: Content) -> some View {
        content
            .withViewSize { view, size in
                view
                    .withAccelerometer(updateInterval: updateInterval) { view, attitude in
                        let xRotation: Double = diminishingRotation(for: attitude.roll * intensity)
                        let yRotation: Double = diminishingRotation(for: attitude.pitch * intensity)
                        view
                            .rotation3DEffect(.radians(xRotation), axis: (0, 1, 0))
                            .rotation3DEffect(.radians(yRotation), axis: (-1, 0, 0))
                            .onChange(of: attitude) { oldValue, newValue in
                                shaderUpdater.update(
                                    with: .init(
                                        x: xRotation * size.width / 2,
                                        y: yRotation * size.height / 2
                                    )
                                )
                            }
                    }
            }
    }
    private func diminishingRotation(for tilt: Double) -> Double {
        let scale: Double = 1 / (1 + abs(tilt) / maxRotation.radians)
        return tilt * scale
    }
}
public extension StickerMotionEffect where Self == AccelerometerStickerMotionEffect {
    static var accelerometer: Self {
        .accelerometer()
    }
    static func accelerometer(
        intensity: Double = 1,
        maxRotation: Angle = .degrees(90),
        updateInterval: TimeInterval = 0.02
    ) -> Self {
        .init(
            intensity: intensity,
            maxRotation: maxRotation,
            updateInterval: updateInterval
        )
    }
}
#endif
