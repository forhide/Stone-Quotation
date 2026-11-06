# v0.20.0 rendered observations

Actual OpenGL Compatibility, Mesa llvmpipe4threads,1280x800, dummy audio, VSync off, no frame cap. Software observations, not Windows/Apple GPU FPS.

Two combat trials:2s warmup+16s measured,8foes with AI/movement frozen, all8signaturefamilies, rolls,fire andloot.

| Case | Mean ms | p95 ms |
| --- | ---: | ---: |
| Combat1 | 34.99 | 47.86 |
| Combat2 | 39.79 | 59.23 |
| exam | 27.81 | 41.01 |
| books | 24.11 | 33.84 |
| garden | 24.89 | 36.66 |
| brand | 19.93 | 29.22 |

Story cases each8s, discard first2s. Exam/books/garden change dialogue twice. CI stays on its logo screen. Raw samples,maxima and action counts are retained. No nativeWindows/Mac60FPS or percentage-improvement claim.
