//
//  ViewSizePreferenceKey.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//


// ViewSizePreferenceKey.swift
// Sticker
//
// Created by Benjamin Pisano on 03/11/2024.
//
import SwiftUI
struct ViewSizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}