The comparison uses the original v0.4.0 source ZIP in an isolated /tmp directory and the new source at 1280×800 on Xorg :77, Godot4.6.3 Compatibility, Mesa llvmpipe. LP_NUM_THREADS=4, OMP_THREAD_LIMIT=1, Dummy audio, V-Sync disabled, frame cap disabled. GPU jobs run sequentially without build/browser/desktop smoke jobs in parallel. Each scene warms up30frames then records180frames. Final-stage stress is deliberately conservative:8inactive enemies,12drops,3persistent floor fires,one burning shelf,2giant projectiles and2impact effects. The tutorial scene uses5inactive enemies and the same effects. AI is inactive, so these are sustained rendering comparisons, not full-combat timing or Windows-PC benchmarks.

The arrival banner is expired before new-version sampling because the test targets sustained combat. The permanent route display remains visible. Wall-clock frame measurements can vary on this shared cloud; raw percentiles and draw counts should be considered together. Godot process/physics monitors can include earlier startup intervals and are not used to claim CPU speedups. An initial tutorial-before trial overlapped other source work and was discarded; only the explicitly named clean baseline and final trials are compared.

| Scene | v0.4.0 draw calls mean | v0.5.0 draw calls mean | Mean frame ms before → after | p95 frame ms before → after |
|---|---:|---:|---:|---:|
| Tutorial effects |94.87|73.03|22.06 →20.97|37.68 →29.81|
| Eight-foe +loot stress |149.54|134.92|33.90 →24.13|57.29 →48.34|

One clean run per scene/version; this is descriptive evidence, not a statistically controlled hardware benchmark. The draw reduction comes from shared painted spell/impact textures replacing repeated primitive trails, and a shared imported enemy atlas replacing per-room render caches. Brief sector-cache rebuilds, actual Windows graphics drivers and long-session behavior require separate native testing.
