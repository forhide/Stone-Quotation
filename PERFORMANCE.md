# Personal Color Lab V0.5.2 performance

Measured in this Linux cloud environment against the retained V0.5.1 algorithms. These are workload-specific CPU measurements, not native M1, Intel Mac, Windows or whole-library guarantees. Resolution, model thresholds, sample bounds and output precision remain unchanged.

## Rendering

OpenCV1thread; deterministic images, fixed seed20261012, one warmup and three alternating before/after measurements. All four before/after output SHA256 values match exactly.

| Workload | Before | After | Speedup |
| --- | ---: | ---: | ---: |
| 1200×800 global | 0.283s | 0.202s | 1.40× |
| 1200×800 regional hybrid | 3.003s | 1.202s | 2.50× |
| 4000×2600 global | 3.448s | 2.294s | 1.50× |
| 3000×2000 regional hybrid | 16.467s | 7.033s | 2.34× |

Identity channel interpolation/HSV conversion is skipped; region recipes are prepared once; hybrid component baselines, tile coordinates and grain coordinates are reused; face-color Lab conversion is restricted to the supported bounding area. Full export retains the160k-pixel tile bound. This table excludes decoding, hashing, inference and UI work.

## Analysis

On a deterministic2000×1333JPEG, seven-run warmed medians with OpenCV4threads: reference appearance0.2953→0.1869s (36.7% less time), palette0.0202→0.0135s (33.2%), pair-color100k samples0.0790→0.0426s (46.1%), complete reference global analysis0.4017→0.2798s (30.3%). Recognition is excluded from the last case. The compared appearance/palette/color results are numerically identical. Details and raw samples accompany ANALYSIS_PERFORMANCE.md.

Reference appearance/palette Python allocation peaks decline; pair color retains more bounded temporary circular-statistic evidence (28.0→31.5MB). These numbers exclude some native memory and do not establish lower RSS for every operation. Batch references reuse the preflight SHA while verifying the final actual file; pair tone-correction is now shared with semantic analysis.

## Recognition and interaction

Three external test-only person/face fixtures, fifteen alternating measurements each: detection time6.50% lower and regional appearance7.89% lower; same detection reports, every mask byte and regional metrics. Model resolution, confidence thresholds and model data are unchanged. ONNX forwards dominate total inference. OpenCV1/2threads were slower than the existing default4, so no process-wide thread change was shipped.

Studio photo tiles are bounded224px calculations using decoded pixels, the existing source measurements and masks, without another model forward. Stable source/style thumbnails are reused across intensity changes. View-only wipe updates coalesce pointer events and blend display-sized pixels; the hidden image view is not reencoded. This interaction path is functionally tested, not timed as an FPS guarantee.

Original photo files, sRGB/GPS behavior and exported full-resolution source bytes stay protected. No runtime APIs, network access, model download or new dependency is introduced. Benchmark raw JSON, selected cProfile output and documented platform limits accompany the release.
