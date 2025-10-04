//
//  AccelerometerAttitude.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//


// AccelerometerAttitude.swift
// Sticker
//
// Created by Benjamin Pisano on 15/11/2024.
//
import Foundation
import CoreMotion
struct AccelerometerAttitude: Equatable, Hashable, Sendable {
    let pitch: Double
    let roll: Double
    let yaw: Double
    init(
        pitch: Double = 0,
        roll: Double = 0,
        yaw: Double = 0
    ) {
        self.pitch = pitch
        self.roll = roll
        self.yaw = yaw
    }
    init(attitude: CMAttitude) {
        self.pitch = attitude.pitch
        self.roll = attitude.roll
        self.yaw = attitude.yaw
    }
    static func - (lhs: AccelerometerAttitude, rhs: AccelerometerAttitude) -> AccelerometerAttitude {
        .init(
            pitch: lhs.pitch - rhs.pitch,
            roll: lhs.roll - rhs.roll,
            yaw: lhs.yaw - rhs.yaw
        )
    }
}