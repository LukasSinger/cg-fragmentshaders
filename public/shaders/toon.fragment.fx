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
    FragColor = vec4(vec3(round(texColor * 4.0) / 4.0), texColor.a);
}
