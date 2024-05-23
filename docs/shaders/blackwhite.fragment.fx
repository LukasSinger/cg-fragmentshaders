#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform int effectStrength;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 texColor = texture(image, model_uv);
    float lum = 0.299 * texColor.r + 0.587 * texColor.g + 0.114 * texColor.b;
    float effectStrength = float(effectStrength) / 50.0;
    float r = texColor.r * (1.0 - effectStrength) + lum * effectStrength;
    float g = texColor.g * (1.0 - effectStrength) + lum * effectStrength;
    float b = texColor.b * (1.0 - effectStrength) + lum * effectStrength;
    FragColor = vec4(r, g, b, texColor.a);
}
