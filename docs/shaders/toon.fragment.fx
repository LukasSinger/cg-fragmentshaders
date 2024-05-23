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
    if (effectStrength == 0) {
        FragColor = texColor;
    } else {
        float discretization = 50.0 / float(effectStrength);
        FragColor = vec4(vec3(round(texColor * discretization) / discretization), texColor.a);
    }
}
