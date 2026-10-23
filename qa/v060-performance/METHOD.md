# v0.6.0 render comparison

Godot4.6.3 Compatibility/OpenGL, Mesa llvmpipe software renderer, Xorg:77,1280×800, LP_NUM_THREADS=4, OMP_THREAD_LIMIT=1, Dummy audio, V-Sync/frame cap disabled. Old v0.5.0 source ZIP extracted into an isolated /tmp project. Four GPU trials ran sequentially without simultaneous GUI/build jobs;30warmupframes +180samples. An earlier baseline trial overlapped imports and was discarded. Narrative overlays are skipped and the arrival card expired so the comparison measures sustained combat presentation. New HD backgrounds remain a single cached quad; new book boss is included in the final-room stress.

| Scene | Draw calls v0.5 →v0.6 | Mean frame ms | p95 ms |
|---|---|---|---|
| Tutorial with effects |72.86 →76.36|24.15 →28.19|45.42 →48.69|
| Final8foes +12drops +effects |134.43 →139.24|30.94 →26.91|55.83 →39.98|

The new cream UI and boss add roughly4–5draw calls. Tutorial timing was slower in this single run; stress timing was faster. This is descriptive shared-cloud evidence and does not establish a general FPS improvement or predict native Windows hardware performance. AI is inactive during these rendering fixtures. Startup-sensitive process/physics monitor averages are included in JSON but not used to claim CPU improvements. Actual Windows drivers, long-session frame pacing and Mac runtime remain separate validation work.
