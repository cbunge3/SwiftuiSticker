// ReflectionShader.metal
// Sticker
//
// Created by Benjamin Pisano on 31/10/2024.
//
#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;
[[ stitchable ]] half4 reflection(float2 position, half4 color, float2 size, float2 reflectionPosition, float reflectionSize, float intensity) {
    // Normalize the current position to UV coordinates
    float2 uv = position / size;
    // Calculate the distance between the UV position and the normalized reflection position
    float d = distance(uv, reflectionPosition);
    // Create a gradient based on the distance to achieve a smooth, blurred edge
    float blurFactor = smoothstep(reflectionSize / size.x, 0.0, d);
    // Calculate the reflection color based on intensity and blur factor
    half4 reflectionColor = half4(1.0, 1.0, 1.0, intensity * blurFactor);
    // Blend the reflection with the original color
    return mix(color, reflectionColor, reflectionColor.a);
}
