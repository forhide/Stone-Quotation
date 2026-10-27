# Rendered performance comparison

The published v0.12.0 source ZIP is the independent baseline. The runner verifies
its SHA-256 and compares its scripts, shaders, scenes, data, artwork and project settings
with the extracted baseline before any measurement. Both versions run the exact
same copied `common-render-fixture.gd`; its hash is recorded in every result.

Run `/tmp/meow-v0130-performance.py` after imports, edits, builds and other Godot
instances have finished. It refuses to run while another live Godot process is
present. The default is two trials of three cases per version, about two minutes
plus scene startup. Version order alternates across trials. Each run uses actual
GL Compatibility rendering on Xorg `:77`, four llvmpipe threads, a 1280 × 800
window, VSync disabled and no frame cap. It records two seconds of warmup followed
by eight seconds of frame intervals, CPU process/physics time, draw calls,
primitives and rendered objects. Per-frame intervals and logs remain alongside
the summary; no performance improvement is assumed or asserted in advance.

The shared cases are:

- **Combat:** eight controlled enemies and attack warnings, one burning shelf,
  three sustained floor fires, two sustained impacts, seven fixed elemental
  projectiles, twelve drops, three equipped accessories, actual walking/rolling,
  and periodic real special casts with all three outcomes. AI is disabled and
  health is kept high so random defeat or room transitions cannot change load.
  Floors and impacts have explicit bounds; effect lifetimes still run normally.
- **Shop:** the real first shop gathering, ambient animal motion and repeated
  interaction with Pip, without opening the equipment modal.
- **Story:** the real final chapter with alternating book-reaction dialogue
  pages. Each version renders its own shipped page-change behavior and actor
  animation; the text timing and page indices are identical.

The optional current-only quality check uses
`--only current --resolution 3840x2160 --trials 1`. A display large enough to hold
that window must already exist. The runner never resizes the X server and checks
the actual window size before accepting the result. This check is separate from
the common 1280 × 800 comparison, because the new native canvas renders more
pixels than the old fixed-resolution viewport.

These are Linux software-rendered presentation measurements. They do not prove
native Windows GPU FPS, monitor-level pacing, or actual Mac execution. Warmup
excludes startup and shader compilation, so these results do not quantify a
first-cast stall on a cold Windows driver cache. Frame p50/p95/p99 and CPU time
must be interpreted separately; headless CPU timings are never presented as FPS.

## Story regression and follow-up

The first integrated story result regressed: the average of two trial p95s was
132.3615ms, compared with 78.516ms for the published baseline. Inspection found
that the fully opaque story overlay still left the covered game world and HUD
rendering behind it. The final implementation temporarily hides those covered
nodes, preserves each original local visibility flag, and restores every flag
when the story closes. Story animation and page continuity continue normally.

Only the current story case was remeasured, with the same fixture and 2 trials;
its final average trial p95 is51.68ms. The completed baseline story trials and
paired combat/shop trials remain unchanged because the visibility branch is
inactive outside stories. The before/after summaries and reason are retained in
`story-occlusion-remediation.json`; `comparison-1280.json` records the final
results. This follow-up is explicit rather than silently replacing a failed
measurement with an unrelated scenario.

The four 3840x2160 visual captures use 16:10 letterboxing: the game content and
adaptive background cache are 3456x2160 inside the actual window. The separate
4K combat quality run measured mean 274.8029ms and p95 455.908ms on llvmpipe. It
establishes native-resolution rendering and its software-rendering cost; it
does not establish 4K60fps or native Windows GPU performance.
