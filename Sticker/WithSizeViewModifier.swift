 //
//  WithSizeViewModifier.swift
//  Sippd
//
//  Created by Cory Bunge on 9/14/25.
//


//
import SwiftUI
struct WithSizeViewModifier<ModifiedContent: View>: ViewModifier {
    let makeView: (AnyView, CGSize) -> ModifiedContent
    @State private var size: CGSize = .zero
    func body(content: Content) -> some View {
        makeView(AnyView(content), size)
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ViewSizePreferenceKey.self, value: proxy.size)
                }
            }
            .onPreferenceChange(ViewSizePreferenceKey.self) { [$size] newSize in
                $size.wrappedValue = newSize
            }
    }
}
extension View {
    func withViewSize<ModifiedContent: View>(
        @ViewBuilder _ makeView: @escaping (_ view: AnyView, _ size: CGSize) -> ModifiedContent
    ) -> some View {
        modifier(WithSizeViewModifier(makeView: makeView))
    }
}
