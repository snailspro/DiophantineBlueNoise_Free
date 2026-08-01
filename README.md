<div align="center">

# 🌊 Diophantine Blue Noise (Free Version)

**Zero-VRAM Procedural Blue Noise — Powered by Number Theory**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Performance](https://img.shields.io/badge/VRAM-0%20Bytes-success)]()

By **Basin Mathematics**

</div>

---

## 🛑 The Problem

Modern graphics pipelines require high-quality noise for dithering, ambient occlusion, screen-space reflections, and volumetric rendering. Historically, this meant relying on **Blue Noise Textures**. 

While blue noise textures provide excellent spatial distribution, they come with significant drawbacks:
- **VRAM Waste:** High-quality blue noise textures consume megabytes of VRAM.
- **Bandwidth Bottlenecks:** Constant texture lookups introduce memory latency.
- **Tiling Artifacts:** Repeating a fixed-size texture across a 4K screen causes visible tiling patterns.

## 🧠 The Solution

**Diophantine Blue Noise** replaces traditional noise textures with a pure math, zero-VRAM procedural approach based on **Diophantine approximation** and **Kronecker sequences**.

By leveraging specific irrational numbers and modular arithmetic, we generate noise that exhibits the characteristic high-frequency "blue noise" spectrum without a single texture read.

### The Math (Briefly)

Instead of pseudorandom hash functions (which produce "white noise" with clumping), we use low-discrepancy sequences extended for spatial dimensions. For temporal stability, we apply a Weyl sequence based on the golden ratio ($\phi \approx 1.61803398875$). The result is a mathematically uniform distribution of values that minimizes low-frequency variance.

---

## 🎮 Get the Full Version

This repository contains the raw **GLSL** snippet under the MIT License for you to implement in your own custom engine.

If you want the **plug-and-play integrations** with all quality tiers and temporal support already set up for major engines, check out the full commercial version on Gumroad:

👉 **[Get the Full Bundle on Gumroad](https://visualizealex.gumroad.com/l/qunsg)**

The full bundle includes:
- **Unity (URP/HDRP)** shaders and C# integration
- **Unreal Engine 5** `.usf` and Material Functions
- **Godot 4** `.gdshader` post-process
- **ReShade** `.fx` plugin
- **WebGPU WGSL** implementation

---

## 🚀 Quick Start (GLSL)

Include the single-file header in your shader:

```glsl
#include "diophantine_blue_noise.glsl"

void main() {
    vec2 uv = gl_FragCoord.xy;
    
    // Generate static blue noise
    float noise = DBN_GetSpatial(uv);
    
    // Apply dithering
    vec3 color = calculateLighting();
    color += (noise - 0.5) / 255.0; 
}
```

## 📄 License
This standalone GLSL file is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
