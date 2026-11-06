# v0.19.0 final rendered observations

Actual OpenGL Compatibility, Mesa llvmpipe4 threads,1280×800, dummy audio, V-Sync off and no frame cap. Final frozen291 inputs. Software renderer observations, not Windows or Apple Silicon GPU FPS.

Two trials:2s warmup+16s measured;8 foes,8 elemental specials,11 casts,10 rolls, floor fire and loot.

| Case | Mean ms | p95 ms |
| --- | ---: | ---: |
| Combat1 | 32.37 | 41.79 |
| Combat2 | 33.80 | 48.70 |
| exam | 66.53 | 180.85 |
| books | 37.91 | 136.98 |
| garden | 23.82 | 31.92 |
| brand | 17.19 | 22.04 |

Story cases each run8s and discard2s warmup. Exam/books/garden perform two real dialogue changes; CI remains on its logo screen. Raw samples, maxima and action counts are retained. Static world details are cached once per arrival, bookcase poses reuse atlas crops, and CI uses a logo plus the existing painted classroom. No60FPS or percentage-improvement claim.
