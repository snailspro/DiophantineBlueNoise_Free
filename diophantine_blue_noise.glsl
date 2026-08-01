/*
 * Diophantine Blue Noise - Standalone GLSL
 * 
 * Product by Basin Mathematics
 * License: MIT
 * 
 * Description:
 * Procedural blue noise generation using Kronecker sequences with irrational 
 * constants. This is a standalone include file suitable for both compute and 
 * fragment shaders in any OpenGL or Vulkan pipeline.
 */

#ifndef DIOPHANTINE_BLUE_NOISE_H
#define DIOPHANTINE_BLUE_NOISE_H

const float DIOPHANTINE_ALPHA_1 = 0.7548776662466927;
const float DIOPHANTINE_ALPHA_2 = 0.5698402909980532;
const float DIOPHANTINE_ALPHA_3 = 0.4323332402447936;

/**
 * Generates 1D procedural blue noise.
 * @param pixel_coord Integer coordinates of the pixel
 * @param frame_index Integer frame index for temporal animation
 * @return 1D scalar noise value in [0, 1)
 */
float diophantine_blue_noise_1d(uvec2 pixel_coord, uint frame_index) {
    float spatial = fract(float(pixel_coord.x) * DIOPHANTINE_ALPHA_1 + float(pixel_coord.y) * DIOPHANTINE_ALPHA_2);
    float temporal = fract(float(frame_index) * DIOPHANTINE_ALPHA_3);
    return fract(spatial + temporal);
}

/**
 * Generates 2D procedural blue noise.
 * @param pixel_coord Integer coordinates of the pixel
 * @param frame_index Integer frame index for temporal animation
 * @return 2D vector noise value in [0, 1)^2
 */
vec2 diophantine_blue_noise_2d(uvec2 pixel_coord, uint frame_index) {
    float n1 = diophantine_blue_noise_1d(pixel_coord, frame_index);
    float n2 = fract(n1 + DIOPHANTINE_ALPHA_1);
    return vec2(n1, n2);
}

/**
 * Generates 3D procedural blue noise.
 * @param pixel_coord Integer coordinates of the pixel
 * @param frame_index Integer frame index for temporal animation
 * @return 3D vector noise value in [0, 1)^3
 */
vec3 diophantine_blue_noise_3d(uvec2 pixel_coord, uint frame_index) {
    float n1 = diophantine_blue_noise_1d(pixel_coord, frame_index);
    float n2 = fract(n1 + DIOPHANTINE_ALPHA_1);
    float n3 = fract(n1 + DIOPHANTINE_ALPHA_2);
    return vec3(n1, n2, n3);
}

#endif // DIOPHANTINE_BLUE_NOISE_H
