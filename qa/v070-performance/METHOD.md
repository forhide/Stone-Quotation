# Equipment rendering / v0.7.0

Godot4.6.3 Compatibility, Xorg:77,1280×800, Mesa llvmpipe software renderer, Dummy audio, LP_NUM_THREADS=4, OMP_THREAD_LIMIT=1. V-Sync/frame cap disabled;30warmup +180samples. Both jobs ran sequentially without other GUI jobs. Same current-version final room:8foes with inactiveAI,12drops, floor fire and overlapping effects. Korean UI, timed arrival finished; story bypassed for rendering only. The equipped run adds apprentice thesis, nine-lives collar and moonlit yarn through real equip actions.

| Same scene | Mean draw calls | Mean ms | p95 ms |
|---|---:|---:|---:|
| Empty slots |147.40|38.06|73.83|
| All three worn slots |149.89|35.68|56.38|

This is one shared-cloud measurement per condition, not a controlled native-Windows FPS benchmark or a claim of general speed improvement. AI and long-session frame pacing are outside the fixture. Three Sprite2D attachments and their shared atlas are created/cached once; no per-frame image bake, mesh rebuild or particle emitter was added for equipment. Story presentation selects one shared HD plate and a separate hero, while combat retains the existing cached room background.
