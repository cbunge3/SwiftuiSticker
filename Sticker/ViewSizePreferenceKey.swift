//
//  ViewSizePreferenceKey.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//



//
import SwiftUI
struct ViewSizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
