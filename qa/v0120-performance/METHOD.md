# v0.12.0 render measurements

All six final cases ran sequentially on the same Xorg :77 Mesa llvmpipe software renderer, with LP_NUM_THREADS=4 and OMP_THREAD_LIMIT=1, uncapped and without VSync. No other GUI game, browser, import, build or headless test ran during the timed frames. Source tests finished before measurement; exports started afterwards. The published v0.11.0 source ZIP was extracted to an isolated project and imported before timing. Its archive SHA is in baseline.json. The first cold baseline import creates the custom font cache; the second prepared import is clean. Neither import is timed.

Warning/combat and shop fixtures warm30frames and sample180. The common warning fixture forces the same eight-foe final-room warnings, flames, falling/burning case, two giant fireballs, twelve drops, movement and worn equipment. New book sprites/boss art are allowed to differ as the actual release presentation; this is a controlled rendering load, not a natural campaign or hardware FPS benchmark. The shop fixture enters the same first reststop and leaves its NPCs idle.

| Fixture | Mean/max draw calls | Frame mean / median / p95 (ms) |
| --- | --- | --- |
| v0.11 warning |156.64 /160|38.66 /33.97 /67.73|
| v0.12 warning |158.76 /162|34.60 /33.25 /50.18|
| v0.11 shop |78.84 /81|23.67 /20.62 /46.67|
| v0.12 shop |79.42 /82|24.70 /23.27 /36.50|
| v0.12 seven fire control |73 /73|21.41 /20.12 /31.89|
| v0.12 seven primary families |110 /110|20.84 /19.73 /32.23|

The primary-magic fixture warms40frames and samples180. Both cases instantiate seven real normal-sized SpellProjectile actors in the same current-release room, held stationary to compare presentation. The control draws seven fire quads; the mixed case draws one fire/water/ice/wind/stone/leaf/lightning. It excludes the showcase labels/icons during timing. New rounded vector spells add37draw calls to this deliberately dense mixed case; measured wall-clock time is mixed, so this does not establish a speedup. Default gameplay normally has fewer simultaneous primary shots.

Combat draw count rises about2.1; new shop idle adds about0.6 mean calls. The new book/mushroom foes share one atlas; the book antagonist shares one four-expression atlas across story and combat. Round spell paths are cached, background art is cached per room, and the small shop steam/gesture accents refresh at10Hz. No persistent GPU particles or per-frame background viewport refresh were added. Shop dialogue changes only during interaction; the bubble never rebuilds every frame and pauses with the room.

Raw timings and fixtures are retained beside this document. Results vary across software-rendered cloud runs and do not assert60FPS, a general frame-time improvement, or native Windows/Mac performance.
