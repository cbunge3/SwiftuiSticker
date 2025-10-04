//
//  StickerMotion.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//


// StickerMotion.swift
// Sticker
//
// Created by Benjamin Pisano on 04/11/2024.
//
import Foundation
public struct StickerMotion: Hashable, Equatable, Sendable {
    public var isActive: Bool = false
    public var transform: StickerTransform = .neutral
}