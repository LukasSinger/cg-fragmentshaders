#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float kernel[100];
uniform int effectStrength;

// Output
out vec4 FragColor;

void main() {
    if (effectStrength == 0) {
        FragColor = texture(image, model_uv);
    } else {
        // Calculate 1 pixel in UV coords
        float UV_STEP_X = 1.0 / float(textureSize(image, 0).x);
        float UV_STEP_Y = 1.0 / float(textureSize(image, 0).y);
        // Iterate across surrounding pixels
        FragColor = vec4(0.0);
        for (int i = 0; i < effectStrength * 2 + 1; i++) {
            float x = clamp(model_uv.x + float(i - effectStrength) * UV_STEP_X, 0.0, 1.0);
            for (int j = 0; j < effectStrength * 2 + 1; j++) {
                // Clamp at border of image
                float y = clamp(model_uv.y + float(j - effectStrength) * UV_STEP_Y, 0.0, 1.0);
                vec4 texel = texture(image, vec2(x, y));
                FragColor += texel * kernel[i] * kernel[j];
            }
        }
    }
}
