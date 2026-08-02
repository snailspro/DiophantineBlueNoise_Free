/*
 * Diophantine Blue Noise - Standalone GLSL
 * 
 * Product by Basin Mathematics
 * License: MIT
 * 
 * Description:
 * Procedural blue noise generation using Kronecker sequences with irrational 
 * constants and checkerboard phase inversion to remove structural artifacts.
 */

#ifndef DIOPHANTINE_BLUE_NOISE_H
#define DIOPHANTINE_BLUE_NOISE_H

const float DBN_ALPHA_1 = 0.7548776662466927; // Related to sqrt(2)
const float DBN_ALPHA_2 = 0.5698402909980532; // Related to golden ratio
const float DBN_ALPHA_3 = 0.4323332402447936;

/**
 * Generates static procedural blue noise.
 * @param pixel_coord Coordinates of the pixel (e.g. gl_FragCoord.xy)
 * @return 1D scalar noise value in [0, 1)
 */
float DBN_GetSpatial(vec2 pixel_coord) {
    // Core Kronecker sequence (low discrepancy)
    float noise = fract(pixel_coord.x * DBN_ALPHA_1 + pixel_coord.y * DBN_ALPHA_2);
    
    // High-frequency checkerboard phase inversion to destroy diagonal banding
    // and push energy to high frequencies (true blue noise characteristic)
    uvec2 ipos = uvec2(pixel_coord);
    float checker = float((ipos.x ^ ipos.y) & 1u) * 0.5;
    
    return fract(noise + checker);
}

/**
 * Generates temporal procedural blue noise.
 * @param pixel_coord Coordinates of the pixel
 * @param frame_index Frame counter for temporal animation
 * @return 1D scalar noise value in [0, 1)
 */
float DBN_GetTemporal(vec2 pixel_coord, uint frame_index) {
    float noise = DBN_GetSpatial(pixel_coord);
    
    // Weyl sequence temporal shift
    float temporal = fract(float(frame_index) * DBN_ALPHA_3);
    
    return fract(noise + temporal);
}

#endif // DIOPHANTINE_BLUE_NOISE_H
