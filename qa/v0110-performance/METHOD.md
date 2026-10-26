# v0.11.0 render measurements

All final samples ran sequentially on Xorg:77, Mesa llvmpipe software rendering, LP_NUM_THREADS=4 / OMP_THREAD_LIMIT=1, uncapped and without VSync. No browser, other GUI game, import, build or headless test ran during the timed frames. Each case warms30frames and measures180. The baseline is the publishedv0.10.0 source ZIP extracted into an isolated folder and imported twice before timing.

The matched warning fixture forces the same eight-foe final-room warnings, fire, burning shelf, two giant fireballs,12drops, movement and worn equipment. It is a controlled presentation load, not a native-hardware FPS benchmark or natural campaign play. The shop case enters the first reststop with the new market and tea guests; the inventory case opens18items and changes hovered previews every10frames. Menus pause combat as in the game.

| Fixture | Draw calls mean / max | Frame mean / median / p95 (ms) |
| --- | --- | --- |
| v0100-warning | 156.80 / 160 | 35.33 / 32.92 / 54.62 |
| v0110-inventory | 168.06 / 180 | 54.75 / 53.17 / 79.38 |
| v0110-shop | 78.64 / 81 | 24.18 / 22.93 / 35.90 |
| v0110-warning | 159.76 / 163 | 34.14 / 31.69 / 50.87 |

The first inventory prototype had tiny category ornaments on every tile. Removing those18 redundant vector controls makes the pictures cleaner and reduces mean draw calls216.06→168.06(max228→180). Measured mean frame time nevertheless varied42.19→54.75ms across these two cloud software runs; draw-count reduction does not establish a wall-clock speedup. The final comparison table uses the later, final UI sample. Matched combat mean/median/p95 are slightly lower, p99 is slightly higher; no general60FPS or real Windows/Mac performance claim follows.

Shared imported atlases serve the new animal cast, menu icons and worn gear. The market is one painted quad, its friends use the same atlas, and three small steam lines refresh at10Hz while playing and freeze during trading. Historical human story/NPC/boss art and the older crowded weapon atlas remain source references and are excluded from executable exports.
