#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec2 normUV = (model_uv * 2.0) - 1.0;
    float theta = atan(normUV.y, normUV.x);
    float radius = pow(length(normUV), 1.5);
    vec2 fishUV = vec2(radius * cos(theta), radius * sin(theta));
    vec2 finalUV = 0.5 * (fishUV + 1.0);
    if (finalUV.x > 1.0 || finalUV.y > 1.0 || finalUV.x < 0.0 || finalUV.y < 0.0) {
        FragColor = vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        FragColor = texture(image, finalUV);
    }
}
