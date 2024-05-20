#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 texColor = texture(image, model_uv);
    float lum = 0.299 * texColor.r + 0.587 * texColor.g + 0.114 * texColor.b;
    FragColor = vec4(lum, lum, lum, texColor.a);
}
