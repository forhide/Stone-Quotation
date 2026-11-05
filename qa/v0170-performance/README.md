# v0.17.0 performance observations

These are actual OpenGL Compatibility captures at1280×800 on Mesa llvmpipe (software rendering), with four renderer threads, dummy audio, V-Sync disabled, and no frame cap. They are not Windows/Mac GPU benchmarks and do not establish a60FPS guarantee or a reliable percentage speed-up.

`expanded-fixture.gd` uses eight live enemy families, repeated elemental special skills, rolls, fire and loot. Each trial runs18 seconds, discarding the first two seconds. `story-fixture.gd` measures three illustrated story scenes, two dialogue changes each. Full raw frame data and setup are preserved beside this file.

Two initial v0.17 trials had mean frame times160.57ms and77.10ms, with p95270.60ms and142.94ms (`expanded-combat-*.json`). The shared software-rendered environment is very variable. A contemporaneous old/new/old comparison used the exact same fixture and rendering settings:

| Trial | Mean ms | p50 ms | p95 ms | Mean draw calls | Skill casts / rolls |
| --- | ---: | ---: | ---: | ---: | ---: |
| v0.16 baseline |61.84|57.54|122.18|380.80|11 /10|
| v0.17 painted effects |38.81|35.85|57.93|355.62|11 /10|
| v0.16 repeat |97.87|53.31|198.25|375.85|11 /10|

The older build itself changed substantially between runs. These numbers are retained as observations, not a hardware performance comparison. See `paired-summary.json` for cgroup CPU counters around each run and the corresponding raw JSON/log files. The separate story observations are in `final-story.json`.

The revised presentation uses shared cropped atlases, cached materials, ground-layer effects, bounded sprite counts, and cached backgrounds. It does not allocate a shader material for each companion-skill cast. Swept obstacle checks operate on a small per-room list; no per-frame physics bodies or image generation are introduced. Native Windows and Apple Silicon frame pacing still need testing on those machines. Desktop/Wine/browser functionality is recorded separately in QA-v0.17.0.md.
