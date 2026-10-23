# v0.7.0 → v0.8.0 rendering measurements

Eight measurements completed without runtime errors. Four initial old/current conditions exposed an expensive warning renderer; one batched rerun verified fewer draw calls; one scale-corrected rerun produced an unexpected timing outlier; two sequential unchanged-old/final-new controls investigated that outlier. All observations are retained below. No further performance run or source change followed these controls.

## Environment and reproducibility

Godot4.6.3 Compatibility, Xorg:77,1280×800, Mesa25.0.7 llvmpipe (LLVM19.1.7) software renderer, Dummy audio, LP_NUM_THREADS=4, OMP_THREAD_LIMIT=1. V-Sync and frame cap disabled;30warmup +180sample frames per run. Korean UI, completed arrival banner, isolated progress/settings and MEOW_SKIP_STORY=1 are consistent. Measured GUI jobs were sequential, with no other game/browser GUI, import or build job scheduled concurrently.

The old project was extracted from the published v0.7.0 source ZIP to /tmp/meow-v070-perf-source. `old-source.json` records its archive hash. No new game scripts/artwork were copied into it. First cold import logged missing font-cache references while creating its cache; subsequent prepared import completed cleanly. Both import logs are retained outside measured runs.

The current warning controls use the final scale-corrected source. No optional same-transform setter guard was applied. `render-source-hashes.json` identifies that final measured snapshot; prior hashes are preserved separately.

## Fixtures

- `wardrobe`: existing final-room stress, unchanged between versions:8foes with inactiveAI,12drops,3fires, burning shelf, overlapping effects. The cat holds a cast pose and wears thesis book/nine-lives collar/moonlit yarn. It has no active warnings, so later warning batching/transform fixes do not affect it. The later last-partial-roll-tick fix is also outside this no-roll scene; the measured/later player hashes are retained in `post-measurement-note.json`.
- `walk +warnings`: same stress scene plus `common-walk-warnings.gd`, unchanged for both versions. Real right-movement input drives the cat while its position resets to stay in view. Casting is cleared so feet animate. All8foes, including the examiner, are held in windup with matching directions and progress. This exceeds a typical simultaneous warning load. The same3equipment pieces are worn. No roll is triggered.

## All eight observations

| Version | Condition | Mean ms | p50 ms | p95 ms | Mean draws | >33ms /180 |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| v070 | wardrobe (initial) | 22.79 | 21.68 | 30.59 | 150.58 | 3 |
| v070 | walk +warnings (initial) | 27.48 | 25.95 | 41.05 | 189.36 | 23 |
| v080 | wardrobe (unchanged) | 25.00 | 23.71 | 39.08 | 150.53 | 17 |
| v080 | walk +warnings before batching | 33.03 | 32.17 | 42.97 | 366.58 | 72 |
| v080 | batched; inherited elite scale | 29.45 | 27.44 | 44.24 | 159.18 | 33 |
| v080 | scale-correct; first observation | 53.54 | 51.79 | 95.14 | 155.11 | 137 |
| v070 | paired control; unchanged baseline | 53.83 | 28.33 | 188.50 | 187.72 | 52 |
| v080 | paired control; final code | 29.29 | 27.02 | 45.32 | 159.13 | 35 |

`all-eight-measurements.json` links every raw JSON; matching logs are alongside them. `comparison.json` retains the unchanged wardrobe observations and the last paired warning controls. Earlier tables remain in `comparison-before-batch.json`, `comparison-before-scale-fix.json` and `comparison-final-scale-first.json`.

## What the measurements establish

The initial current warning renderer averaged366.58draw calls. Drawing each cue as a single SDF shader quad reduced subsequent warning observations to about155–159draw calls (final159.13, max162). Published v0.7.0 warning observations were about188–189draw calls. This verifies the render-budget improvement while preserving the tested warning footprint and attack timing.

The inherited elite art scale initially inflated floor cues. Resetting the warning to a unit-scale world transform makes its rendered310-pixel boss endpoint and35.05-pixel half-width match collision geometry. Both scaled and corrected observations are retained; no combat hitbox was changed by this fix.

Frame timings were unstable. The first scale-corrected current run measured53.54ms mean/95.14ms p95; the following unchanged-old control measured53.83ms mean/188.50ms p95, and final current measured29.29ms mean/45.32ms p95. Thus the slow tail also occurred in the unchanged baseline, so these samples do not isolate a general renderer regression or speedup.

The paired control context (`control-environment.json`) found no active extra game/browser process. The cgroup quota was4CPUs. Across the old control,18additional throttling periods and about1.667CPU-seconds throttled were logged; across the following current control, none were logged. This documents variable shared-cloud scheduling conditions. It does not establish why every individual frame was slow.

## Limits

These are software-rendered presentation fixtures with inactiveAI, not natural combat, long-session or native Windows/Mac benchmarks. Timings and their tails are reported in full without converting them to a claimed user-device FPS. Fewer draw calls are verified; improved overall FPS is not claimed. Screenshot/video readback is absent from the measured loops, and the separate walk GIF is pose evidence only.
