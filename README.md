# Meowgnificent the wizard cat — v0.4.0

An eight-area roguelite expedition: tutorial, dangerous library rooms, two merchant stops and a final elite examination. Enemies drop Crowns, equipment and healing food. Compare and equip nine items across wand, collar and charm slots. Crowns and found gear belong to the current expedition; banked Starlight, permanent upgrades and the starting-wand unlock survive defeat and restarts.

Download and extract into a new folder, then launch the game. No installer or terminal command is needed.

- Windows: Meowgnificent-v0.4.0-windows.zip
- macOS / Apple Silicon support: Meowgnificent-v0.4.0-macos.zip
- Linux: Meowgnificent-v0.4.0-linux.zip
- Web server build: Meowgnificent-v0.4.0-web.zip
- Godot source: Meowgnificent-v0.4.0-source.zip

Controls: WASD/arrows move; mouse aim; click/Space cast; Shift + direction roll; I equipment; E nearby merchant/open exit; Enter start or continue after clearing; M legacy upgrades from start/defeat/victory; Esc close/pause; R abandon run. Shop/legacy: click or 1–4. F1/F2/F3 force the next spell outcome.

Permanent progress is saved locally. Resuming an unfinished expedition is not implemented. The final elite uses existing enemy AI; this is not a new boss with unique patterns.

Actual Windows hardware performance and Mac runtime were not tested. The Mac app is ad-hoc signed and not Apple-notarized; see PLAY-MACOS.txt in the ZIP. See CHANGES.md for validation scope and performance limits, and Meowgnificent-v0.4.0-SHA256SUMS.txt for integrity checks. Anonymous file-host links remain withdrawn.

Validation: 261 source checks, 22 Windows/Wine executable checks, 22 Linux executable checks and 14 Chromium Web checks passed. Desktop checks cover tutorial combat, area02 transition, loot, real equipment UI clicks, defeat and permanent progress restored in a fresh process. Headless integration covers all8areas/twoshops; full-campaign desktop playthrough was not automated. Web persistence was verified across a full page reload. Mac package metadata, arm64, permissions and signature hashes were checked. Platform ZIPs exactly match the tested executables.
