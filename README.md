# Meowgnificent the wizard cat — v0.2.2

Rendering performance fix for stutters reported on Windows during spells, fire and rolling. Full-body motion and the accident-room gameplay remain.

Download, extract into a new folder, and launch the game. No installer or terminal command is needed.

- Windows x86_64: Meowgnificent-v0.2.2-windows.zip
- macOS / Apple Silicon support: Meowgnificent-v0.2.2-macos.zip
- Linux x86_64: Meowgnificent-v0.2.2-linux.zip
- Web server build: Meowgnificent-v0.2.2-web.zip
- Godot source: Meowgnificent-v0.2.2-source.zip

The cat is rendered with one indexed mesh and GPU deformation, and the unchanging room background is cached as a texture. Rendering uses a 1280×800 internal viewport and a 60 FPS default limit.

In a controlled 1280×800 software OpenGL effects scene, mean frame time fell from 46.42 to 20.53ms and p95 from 77.45 to 29.14ms. These are test-environment results, not a measurement of the user's Windows hardware.

90 source checks and 10 executable checks each on Linux and Windows/Wine passed. The Mac app bundle and signature hashes were checked; actual Mac runtime and Apple notarization were not tested. The official Universal template is retained for Apple Silicon support; Intel Mac hardware is not a test target.

Controls: WASD/arrows move; mouse aim; click/Space cast; Shift + direction roll; Enter start/retry; Esc pause; R restart. F1/F2/F3 force the next spell result.

See CHANGES.md for details and Meowgnificent-v0.2.2-SHA256SUMS.txt for hashes. Previously shared anonymous file-host links remain withdrawn.
