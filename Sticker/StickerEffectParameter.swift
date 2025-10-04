// StickerEffectParameter.swift
// Sticker
//
// Created by Benjamin Pisano on 05/11/2024.
//
import SwiftUI
extension EnvironmentValues {
    @Entry var stickerScale: Float = 3
    @Entry var stickerColorIntensity: Float = 0.8
    @Entry var stickerContrast: Float = 0.9
    @Entry var stickerBlend: Float = 0.4
    @Entry var stickerCheckerScale: Float = 5
    @Entry var stickerCheckerIntensity: Float = 1.2
    @Entry var stickerNoiseScale: Float = 100
    @Entry var stickerNoiseIntensity: Float = 1.2
    @Entry var stickerLightIntensity: Float = 0.3
    @Entry var stickerPattern: StickerPatternType = .diamond
}
extension View {
    public func stickerScale(_ scale: Float) -> some View {
        environment(\.stickerScale, scale)
    }
    public func stickerColorIntensity(_ intensity: Float) -> some View {
        environment(\.stickerColorIntensity, intensity)
    }
    public func stickerContrast(_ contrast: Float) -> some View {
        environment(\.stickerContrast, contrast)
    }
    public func stickerBlend(_ blendFactor: Float) -> some View {
        environment(\.stickerBlend, blendFactor)
    }
    public func stickerCheckerScale(_ scale: Float) -> some View {
        environment(\.stickerCheckerScale, scale)
    }
    public func stickerCheckerIntensity(_ intensity: Float) -> some View {
        environment(\.stickerCheckerIntensity, intensity)
    }
    public func stickerNoiseScale(_ scale: Float) -> some View {
        environment(\.stickerNoiseScale, scale)
    }
    public func stickerNoiseIntensity(_ intensity: Float) -> some View {
        environment(\.stickerNoiseIntensity, intensity)
    }
    public func stickerLightIntensity(_ intensity: Float) -> some View {
        environment(\.stickerLightIntensity, intensity)
    }
   
    public func stickerPattern(_ type: StickerPatternType) -> some View {
        environment(\.stickerPattern, type)
    }
}
