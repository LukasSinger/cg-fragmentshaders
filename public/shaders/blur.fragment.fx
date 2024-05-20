#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float blurStrength;

// Output
out vec4 FragColor;

void main() {
    float blurStrength = blurStrength / 5.0;

    FragColor = texture(image, model_uv);
}
