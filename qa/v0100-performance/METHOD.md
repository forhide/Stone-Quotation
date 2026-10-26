# v0.10.0 render measurements

Measurements ran sequentially on the same Xorg:77 Mesa llvmpipe software renderer, LP_NUM_THREADS=4 and OMP_THREAD_LIMIT=1, uncapped/without VSync. Imports, other GUI games and browser checks were completed/stopped before these four final samples. A cancelled partial run while build checks started was discarded; the final files below replace it.

The old project was extracted from the published v0.9.0 source ZIP into an isolated folder and imported twice outside the sample. The same eight-foe final-room fixture supplies static drops, floor fire, burning shelf, two giant fireballs, three worn items, movement and forced attack warnings. It skips the transient arrival card, warms30frames and collects180frames. This forces presentation state and is not an end-to-end AI gameplay/FPS benchmark.

`v0100-pages` adds a sustained six-page item skill with damage disabled. `v0100-shards` sustains an exposed shield at successive shatter ages without changing combat balance. These are bounded additional visual loads, not old/new matched comparisons.

| Fixture | Draw calls mean/max | Frame mean / p50 / p95 / p99 (ms) |
| --- | --- | --- |
| v0100-pages | 180.80 / 184 | 33.73 / 29.26 / 57.11 / 70.56 |
| v0100-shards | 158.72 / 163 | 37.98 / 33.98 / 59.32 / 135.72 |
| v0100-warning | 159.10 / 163 | 48.47 / 40.03 / 106.39 / 159.38 |
| v090-warning | 158.87 / 162 | 49.68 / 46.51 / 87.00 / 134.43 |

Matched warning draw count stays nearly flat(158.87 to159.10). Mean and median frame times are lower, but p95/p99 are higher; this mixed software-renderer result does not establish a general speedup,60FPS or Windows/Mac hardware performance. The new whole-body walk reuses one immutable mesh and imported atlas, and the boss barrier uses one quad rather than per-fragment nodes or dynamic lights. The shader computes12sector shards analytically without loops. No global time scale/hit-stop changes combat or pause timing.
