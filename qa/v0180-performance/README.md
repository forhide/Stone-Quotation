# v0.18.0 rendered observations

Actual OpenGL Compatibility, Mesa llvmpipe4 threads,1280×800, dummy audio, V-Sync off, no frame cap. This is software rendering, not native Windows or Apple Silicon GPU performance.

The shared stress fixture keeps eight live enemy families and casts all eight signature skills, with rolls, floor fire and loot. Each trial has2s warmup and16s measured. Both trials performed11 special casts and10 rolls.

| Trial | Mean ms | p95 ms | Mean draw calls |
| --- | ---: | ---: | ---: |
| combat1 |46.62|74.18|374.82|
| combat2 |39.40|57.65|371.89|

The added furniture, layered materials and textured direction signs remain bounded; arrow ornaments are sampled inside one warning quad rather than spawning additional particles/nodes. The spell atlases, materials, static room art and furniture commands are cached. Dynamic source-alpha cleanup preserves low-opacity contact shadows and smooth fade-out.

Three story scenes each run8s, discard the first2s and make two real dialogue changes. Mean times were27.40ms for the exam,25.95ms for books, and120.33ms for the garden. The garden trial had a1,574.70ms maximum and581.78ms p95; these outliers are retained in `final-story.json`.

To investigate that specific garden result, an additional isolated garden-only old/new/old comparison used the exact same8s fixture and settings:

| Garden comparison | Mean ms | p95 ms | Maximum ms |
| --- | ---: | ---: | ---: |
| v0.17 before |27.42|37.22|307.81|
| v0.18 repeat |26.85|37.84|57.12|
| v0.17 after |38.35|61.77|142.21|

The large initial garden delay did not recur in the new build, and the older build also varied. Its cause was not established. These observations do not prove a percentage performance gain, an absence of stutter on real devices, or60FPS. All raw frame data, draw-call observations and actual page-change counts are preserved. No further broad stress repetition was performed after this focused follow-up.
