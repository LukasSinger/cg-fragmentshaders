#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    vec2 normUV = (model_uv * 2.0) - 1.0;
    float radius = length(normUV);
    vec2 offset = normUV * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;
    vec2 finalUV = model_uv + offset;
    if (finalUV.x > 1.0 || finalUV.y > 1.0 || finalUV.x < 0.0 || finalUV.y < 0.0) {
        FragColor = vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        FragColor = texture(image, finalUV);
    }
}
