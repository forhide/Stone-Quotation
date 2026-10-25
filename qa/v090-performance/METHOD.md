# v0.8.0 → v0.9.0 render fixtures

Godot4.6.3 Compatibility,1280×800 Xorg:77, Mesa llvmpipe software renderer, LP_NUM_THREADS4/OMP_THREAD_LIMIT1, Dummy audio, vsync/framecap off. Each condition runs alone, discards30warmup frames and records180frames. Korean UI, story skipped and isolated profile/settings. The baseline is extracted from the published v0.8.0 source ZIP, imported before measuring. Same common fixture:8inactive-AI foes,12drops,3fires, overlapping effects,3worn items, real right movement and8held warning lanes. The additional v0.9.0 pages condition keeps6orbiting pages alive for render-cost measurement, with damage disabled. This is a staged render fixture, not natural gameplay or native Windows/Mac FPS. No general FPS improvement claim.

| Condition | Mean ms | p95 ms | Mean draw calls |
| --- | ---: | ---: | ---: |
| v0.8.0 warning stress |34.89|53.20|155.82|
| v0.9.0 warning stress |37.99|72.05|161.88|
| v0.9.0 plus6orbiting pages |38.33|63.19|182.71|

The UI and new fire/gait add about6draw calls in the shared fixture; keeping the orbiting-page skill active adds about21more. Fire uses one shaded quad per shot. Skill actors are bounded and cleared on transition; backgrounds are cached once. Timings vary on this shared software cloud and cannot establish native-hardware performance. Raw JSON/logs and the exact fixture accompany these figures.
