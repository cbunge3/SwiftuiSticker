//
//  StickerMotion.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//



//
import Foundation
public struct StickerMotion: Hashable, Equatable, Sendable {
    public var isActive: Bool = false
    public var transform: StickerTransform = .neutral
}
