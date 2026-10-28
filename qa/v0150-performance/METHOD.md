# Rendered story regression check

Published v0.14.0 source versus v0.15.0, sequential actual1280×800 rendering on Xorg:77/GL Compatibility/llvmpipe,4 renderer threads, VSync disabled and uncapped. Each exam/books/garden case lasts8s with first2s excluded; two actual dialogue changes. No other game tests, browser or export runs overlap this comparison. v0.14 baseline122 active runtime files match the previous published export fingerprint; only explicitly archived artwork is absent.

This is one trial to screen for gross regressions. Virtualized software rendering, cache variance and cold texture uploads prevent reliable percentage/native GPU FPS conclusions. Raw frame intervals are retained. This does not test real Windows GPU or Mac FPS.

The final comparison also runs the unchanged tests/performance_v013.gd combat fixture for each version:2s warmup +8s sample, seven normal-sized static elemental flights plus bounded fire/skill/roll/enemy-telegraph load. The same6skill casts and6rolls must be recorded. This covers the additional natural-flight drawing workload. Results after the final fire/charge edits replace the preliminary story-only run.

The final evidence is rerun as one paired v0.14→v0.15 sequence after the painted floor/hen integration. Earlier pre-batching measurements are retained with an explicit before-fire-batching prefix and are not substituted for final results. Environment variance can affect unrelated cases too; conclusions use the recorded limits rather than promising a general FPS increase. Static world props remain in the existing background cache; the shop hen is one shared textured actor.
