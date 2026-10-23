# v0.7.0 QA

Godot4.6.3 Compatibility /1280×800. The final runtime checks below passed; live-link download verification is performed separately at publication.

| Check | Result | Scope |
|---|---:|---|
| Source suites |497/497| Existing451 game/story checks plus46 language/settings/appearance checks |
| Final atlas-crop follow-up |133/133| Smoke29 + story58 + localization/appearance46 after bounding the six character poses |
| Windows / Wine |23/23| Real window/input, tutorial combat, area02, dropped-gear equip, defeat and fresh-process profile reload |
| Linux |23/23| Same23 semantic checks |
| Web gameplay |15/15| English regression path, inventory, movement/cast/pause and IDBFS attempt count after full reload |
| Web English story |10/10| No story bypass: opening, next page, skip, inventory and pause |
| Web Korean/options |15/15| Ordinary URL, Korean default, real language dropdown, English and Korean reload persistence, same-page story translation and returning to gameplay |
| Mac package |pass| ZIP, metadata0.7.0, executable permissions, arm64, PCK and ad-hoc signature hashes |

The source checks follow all8areas, shops, economy, persistent upgrades, real final-room projectile/boss interactions and ending. New checks exercise all9 equipment IDs through the real equip API, shared textures, three fixed attachment nodes, left-facing cast, tucked roll, unequip/reset, language persistence and state restoration. A real Escape event closes settings over story/combat without leaking into skip/pause; this regression was found during browser input testing and fixed with a short input guard.

The50 Korean narrative pages were rewritten for grammar, natural phrasing and consistent voices/names; every page has separate English copy. Korean menu, status, gear, shop, legacy and story screens were visually reviewed. Illustrated plates and staged outfit/ending captures are presentation evidence, not a natural desktop full-campaign playthrough. Wands/books sit beside a paw, collars at the neck and charms on the hat. They remain small accessories and do not cover the cat in clothing.

Web Korean OCR crops the relevant UI region, normalizes contrast for dimmed dialogue behind the settings panel, and reads actual rendered text. Autoplay is paused using the real F10 options UI while checking language on the current page. English combat regression explicitly uses `lang=en`/`MEOW_LANGUAGE=en`; the separate default-language test has no language or story bypass flag. Browser screenshot capture skips waiting for unrelated DOM webfonts; Godot’s canvas text is still asserted by OCR.

## Render fixture

Sequential empty/equipped comparison in the same final-room scene:8inactiveAI foes,12drops, floor fire and overlapping effects,30warmup +180samples, V-Sync/frame cap disabled, Mesa llvmpipe software renderer, LP_NUM_THREADS=4. Mean draw calls 147.40→149.89; mean frame time 38.06→35.68ms, p95 73.83→56.38ms. [Method and raw measurements](qa/v070-performance/METHOD.md). This isolates presentation work and cannot predict native Windows hardware FPS. No overall speedup claim is made. The same atlas is shared by all9 icons; three accessory sprites are allocated once, and the four story plates are not baked per frame.

## Limits and delivery

Windows runtime checks use Wine, not a physical Windows PC. Mac runtime and Apple notarization are not performed; only package/arm64/permissions/signature validation is claimed. Full8area and ending progression is source integration coverage, rather than a desktop/browser campaign-clear bot. Additional spells and companion AI remain outside this prototype.

Each published ZIP is integrity-checked. Windows/Linux payloads are compared by SHA-256 against frozen copies used in the runtime tests; Web payloads and Mac contents/permissions are compared with their validated exports. Final live GitHub URLs are freshly downloaded and checked separately during publication. The original Stone-Quotation application worktree is kept unchanged.

## Evidence

[Source497](qa/v070-source-tests.txt), [final visual/input133](qa/v070-final-visual-tests.txt), [Windows23](qa/v070-windows-results.json), [Linux23](qa/v070-linux-results.json), [Web15](qa/v070-web-log.txt), [English story10](qa/v070-story-web-log.txt), [Korean/options15](qa/v070-localized-web-log.txt), [Mac package](qa/v070-macos-log.txt).
