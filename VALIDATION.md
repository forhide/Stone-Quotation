# V0.2.2 text rendering and installer validation

## Current source and display results

**194 passed, 0 failed, 0 errors, 0 skipped** on Linux/Python 3.13.5/Tcl-Tk 8.6.16, in 16.30 seconds (2026-10-07 UTC). The complete run includes 70 UI/localization cases and nine focused display-initialization cases. English and Korean main/inspector layouts are exercised at 100%, 150%, and 200% synthetic display densities. Existing analysis, cache, database migration, original-file preservation, recovery and worker/window-lifetime checks remain included.

```bash
cd /workspace/Personal-Color-Lab
PERSONAL_COLOR_LAB_BSDTAR=/workspace/.tools/pcl-packaging/archive/usr/bin/bsdtar \
FONTCONFIG_FILE=/workspace/.tools/personal-color-lab-fonts.conf \
PERSONAL_COLOR_LAB_XVFB=/workspace/.tools/personal-color-lab-xvfb/usr/bin/Xvfb \
.venv-desktop/bin/python tools/run_gui_tests.py -x -q \
  --junitxml=/tmp/pcl-v022-final-tests.xml
```

Windows DPI awareness is initialized in the actual Python process before constructing Tk. API tests cover per-monitor-v2 setup, older fallbacks, unavailable APIs, and respect for a host's existing DPI configuration. Initial window DPI sets Tk's point-font scale; spacing, canvas coordinates, window dimensions and rows scale with the display. Fonts retain positive point sizes instead of being rasterized or multiplied twice. Small text is 10 points and detailed measurements use 11 points, with stronger secondary contrast. macOS keeps native system-font selection and Cocoa logical sizing; the bundled Tk 9 Retina path and `NSHighResolutionCapable` remain enabled without a forced extra 2x scale.

Actual running Korean Tk windows were captured and visually inspected under separate 96-DPI and 192-DPI Xvfb displays. The measured densities were 95.96 and 192.15 DPI; the same 10-point small font rendered with 19px and 37px line metrics. The inspector rendered at 1160×900 and 2322×1801 pixels respectively, with summary cards, readable paths and a measured curve visible. These PNGs are native captures, not enlarged copies, and contain only synthetic photo fixtures. Linux rendering does not establish native macOS Retina appearance.

Visible English/Korean UI checks confirm that the old Offline Only badge and repeated privacy/original-file notices are absent. Meaningful confidence, uncertainty, inferred provenance and recovery guidance remain. Both locale files contain 188 matching keys. App version is 0.2.2; analysis algorithm 0.2.0 and database/payload schema 1 are unchanged.

The 32 non-failing warnings are the existing Pillow `getdata()` deprecation exercised by the expanded cases; warnings were retained. A run with skipped display/archive cases does not replace this complete result.

## Rebuilt V0.2.2 installers

All three installers were rebuilt from the verified retained private CPython/native-wheel inputs. Installer SHA-256 sidecars match the final bytes.

- Windows x64: `PersonalColorLab-0.2.2-windows-x64-setup.exe`, 50,415,403 bytes.
- Apple Silicon: `PersonalColorLab-0.2.2-macos-arm64.pkg`, 84,662,162 bytes, minimum macOS 13; 2,402 payload entries.
- Intel Mac: `PersonalColorLab-0.2.2-macos-x64.pkg`, 65,906,245 bytes, minimum macOS 14; 2,311 payload entries.

The final Windows binary passed Wine 10 silent installation, repeat installation, installed-launcher self-test with app version 0.2.2 and a report path containing spaces, and the actual installed Tk GUI. The GUI diagnostic reported Win32 windowing, Windows DPI awareness **2** (per-monitor aware), logical DPI 96.08, body font 11 points and small font 10 points. Direct pair selection, cached reopening, default summaries, measured curves, scan, local database/cache, Korean switching, direction swap and unchanged synthetic source hashes passed with Python network access denied. Uninstall preserved both a user-data sentinel and an unrelated file in the install directory. The test-only Wine UCRT setup described below was not added to the installer. This is Windows binary execution under Wine on Linux.

Independent libarchive extraction checks passed for both macOS packages: all XAR/CPIO file bytes, modes, internal symlinks, complete BOM paths/modes/root-admin ownership and PackageInfo counts match staging. Mac packages contain architecture-matching private runtimes and the new display/theme/localization code. Linux cannot execute Apple Installer or the Mach-O application.

Actual native Windows/macOS installation, Retina appearance, monitor transitions, native CI, signing and Apple notarization remain unverified. Large display scales require enough usable screen space; synthetic density layout tests do not establish fit on every physical monitor. These are unsigned development installers. Per-target JSON reports, installed Windows self-test evidence, JUnit XML and actual screenshots accompany the download delivery.

## Earlier V0.2.1 evidence

# V0.2.1 UI/UX and installer validation

## Current source and desktop results

**175 passed, 0 failed, 0 errors, 0 skipped** on Linux/Python 3.13.5/Tcl-Tk 8.6.16, in 13.86 seconds (2026-10-07). The run includes 60 UI/localization checks, including 21 actual Tk desktop cases. This adds 31 cases to the earlier 144-test installer milestone without removing earlier analysis, persistence or packaging coverage.

```bash
cd /workspace/Personal-Color-Lab
PERSONAL_COLOR_LAB_BSDTAR=/workspace/.tools/pcl-packaging/archive/usr/bin/bsdtar \
FONTCONFIG_FILE=/workspace/.tools/personal-color-lab-fonts.conf \
PERSONAL_COLOR_LAB_XVFB=/workspace/.tools/personal-color-lab-xvfb/usr/bin/Xvfb \
.venv-desktop/bin/python tools/run_gui_tests.py -x -q \
  --junitxml=/tmp/pcl-v021-final-tests.xml
```

Direct comparison tests choose arbitrary JPEG filenames in different folders, without scanning. They exercise canceling either picker, missing/non-JPEG/same-file rejection, original hashes, local persistence, current-session deduplication, cached reopening and localized manual-selection labels. The menu displays English/한국어 and persists en/ko. English and Korean layout tests check visible main actions and empty guidance at 1060×720 and inspector summary values at 940×740. Existing worker/close tests continue to pass.

Summary tests distinguish measured brightness, approximate exposure, color evidence and verified shared area, and use only the engine's measured monotone tone-transfer points. Missing/invalid evidence never creates a zero-valued or synthetic measurement. Failed alignment, unreadable ICC profiles, stale caches and errors withhold summary values/curves and provide recovery steps. Algorithm version remains 0.2.0; app version is 0.2.1, with unchanged payload/database schema 1.

Actual running English/Korean Tk windows were captured and visually inspected at default and minimum sizes. The default 1160×900 inspector has a 143px tone graph; the small-window view keeps the summary cards visible and shows a compact curve. Preview images remain contained with their aspect ratios. Screenshots use synthetic fixtures only. Bundled PNG/ICO/ICNS aperture icons require no runtime download or extra dependency.

The 20 non-failing warnings are from the existing scanner's Pillow getdata usage exercised by more flows; they are not suppressed. Without a display, the 21 desktop cases are explicitly skipped; such a run does not replace this full result.

## Rebuilt V0.2.1 installers

All three installers were rebuilt from the verified retained private CPython/Pillow/NumPy/OpenCV inputs. SHA-256 sidecars were checked against the final installer bytes. App/launcher/setup icons are included.

- Windows x64: PersonalColorLab-0.2.1-windows-x64-setup.exe, 50,417,114 bytes.
- Apple Silicon: PersonalColorLab-0.2.1-macos-arm64.pkg, 84,660,919 bytes, minimum macOS 13; 2,401 payload entries.
- Intel Mac: PersonalColorLab-0.2.1-macos-x64.pkg, 65,904,763 bytes, minimum macOS 14; 2,310 payload entries.

Independent libarchive extraction checks passed for both macOS packages: complete file bytes, permissions, directories, symlinks, BOM paths/modes/root-admin ownership, and PackageInfo counts match staging. Extracted Info.plist versions and CPU/minimum-OS Distribution metadata are correct. Icons, new theme/manual-comparison code and English/Korean resources match the source; both locales contain 191 keys. No Mach-O interpreter or native macOS installer was executed.

The final Windows 0.2.1 binary passed Wine 10 integration: silent installation, repeat installation, the installed launcher self-test (app version 0.2.1, report path containing spaces), and the actual installed Tk GUI. The GUI flow uses direct photo selection without scanning, current-session cached reopening, default summaries and a measured curve, then folder scanning, local DB/cache, Korean switching, direction swap and unchanged synthetic source hashes. Python socket access is denied during this flow. Uninstall preserved both a user-data sentinel and an unrelated file in the install folder. The test-only Wine UCRT setup remains as described in the earlier record. This is Windows binary execution under Wine on Linux, not native Windows verification. Current per-target JSON and fresh JUnit evidence are supplied with the delivery files.

Actual native Windows/macOS installation and GUI execution, native CI, code signing and Apple notarization remain pending. These are unsigned development installers. The delivery branch contains installer downloads and supporting material; the source project's native CI has not been published or run through that branch.

## Earlier V0.2.0 evidence

# V0.2.0 validation and installer evidence

## Current installer milestone

**144 passed, 0 failed, 0 errors, 0 skipped** on Linux/Python 3.13.5/Tcl-Tk 8.6.16, in 11.40 seconds. This includes seven real GUI flows, 11 new package-diagnostic/resource checks and 14 new packaging-integrity checks. Independent libarchive checks validate XAR/CPIO bytes, executable permissions, Unicode paths and internal symlinks. BOM tests explicitly include hidden native libraries; wheel tests reject unsafe paths and wrong CPU/ABI tags.

```bash
cd /workspace/Personal-Color-Lab
PERSONAL_COLOR_LAB_BSDTAR=/workspace/.tools/pcl-packaging/archive/usr/bin/bsdtar \
FONTCONFIG_FILE=/workspace/.tools/personal-color-lab-fonts.conf \
PERSONAL_COLOR_LAB_XVFB=/workspace/.tools/personal-color-lab-xvfb/usr/bin/Xvfb \
.venv-desktop/bin/python tools/run_gui_tests.py -q \
  --junitxml=/tmp/pcl-installer-final-tests.xml
```

Without a display, seven GUI checks are explicitly skipped. Without bsdtar, two independent archive checks are skipped. Cross-host BOM list tests require POSIX cksum. Keep these outcomes distinct from the complete run. The updated cloud install script was executed successfully and pip check reports no broken requirements.

### Windows artifact

PersonalColorLab-0.2.0-windows-x64-setup.exe was compiled with NSIS 3.11 amd64 Unicode stubs. It bundles private CPython 3.13.16/Tcl-Tk 8.6.15, Pillow 12.3.0, NumPy 2.3.5, OpenCV wheel 4.14.0.94, translations and license notices. No administrator elevation, Python installation or runtime downloads are required; pip/ensurepip and build downloaders are excluded.

**Wine 10 integration passed on the final artifact:** silent install, repeat installation, installed launcher --self-test with a report path containing spaces, actual installed GUI scan/inspect/previews/analysis/SQLite/cache/Korean/direction swap, synthetic original hashes, uninstall, retained user-data sentinel and an unrelated file in the install directory. Only that unrelated file remained after uninstall. This is Windows binary execution under Wine on Linux, not native Windows validation.

The installed diagnostic reports Python 3.13.16, Pillow 12.3.0, NumPy 2.3.5, cv2 4.14.0, SQLite 3.53.1 and Tcl 8.6.15 with successful synthetic analysis and temporary DB persistence. cv2.__version__ omits the wheel build suffix. Python network access is blocked during the installed GUI flow.

Wine's bundled ucrtbase lacks NumPy's crealf export. The test-only Wine prefix therefore uses Microsoft's Windows SDK 10.0.28000.2705 UCRT, verified against NuGet's catalog SHA-512 and size. This SDK runtime is not included in the installer; native Windows supplies its UCRT. Provenance is retained at /workspace/.tools/pcl-packaging/ucrt-origin.json. The helper /workspace/scratch/pcl_wine_validate.py starts/stops its own Xvfb. Installation testing also caught a stale language-registry lookup error flag; ClearErrors now scopes failure detection to actual extraction. Final reinstall passed.

### macOS artifacts

- PersonalColorLab-0.2.0-macos-arm64.pkg: Apple Silicon, minimum macOS 13, 2,395 payload entries.
- PersonalColorLab-0.2.0-macos-x64.pkg: Intel, minimum macOS 14, 2,304 payload entries.

Both are actual unsigned flat installer files containing /Applications/Personal Color Lab.app with private architecture-matching Python/Tcl-Tk and native wheels. Minimum OS versions follow wheel tags. Mach-O interpreter dependencies use Apple system frameworks and @executable_path/../lib rather than an external Python installation.

**Independent checks passed for both final packages:** libarchive unpacked XAR/CPIO; every file SHA-256, permission, directory and internal symlink matches staging. Complete BOM paths, modes, root/admin ownership and counts agree with payload and PackageInfo, including hidden .dylibs. Official runtime/PyPI wheel HTTPS and pinned SHA-256 checks remain enabled and all native/wheel license notices are retained.

The bomutils directory scanner skips dotfiles. The cross-builder now uses its supported mkbom -i format with a complete explicit file list and POSIX cksum, rather than omitting essential .dylibs. The local lsbom reader at upstream revision c247002e2f49878bab32dd0fcf805810ae0992cb had a reversed Paths predicate causing a crash; its condition was restored to the original name == "Paths" implementation. The generator is unmodified. This reader correction is retained in /workspace/.tools/pcl-packaging/bomutils. Native macOS builds use Apple's pkgbuild/productbuild instead.

tools/verify_mac_payload.py independently verifies a cross-built package against staging; use --bsdtar /workspace/.tools/pcl-packaging/archive/usr/bin/bsdtar and --lsbom /workspace/.tools/pcl-packaging/bomutils/build/bin/lsbom in this prepared instance. Per-artifact JSON reports and SHA256SUMS are delivered beside the installers.

### Native release limits

Actual native Windows/macOS installer and GUI execution remain unverified. Linux cannot execute Apple Installer or Mach-O apps. The manual .github/workflows/installers.yml rebuilds and tests all three targets using native installation, installed diagnostics, GUI flows and data-preserving removal; it has not run because this ZIP-derived project has no Git remote. Stone-Quotation's remote was not repurposed.

All delivered installers are unsigned development builds. Windows signing, Apple signing/notarization and native release CI remain pending. No credentials are required for local unsigned builds. See INSTALLERS.md for installation and rebuild instructions. Real-photo calibration, RAW/XMP/style application and fresh-cloud restoration remain outside the completed milestone.

## Earlier analysis milestone

Validated on Linux on 2026-10-07 with the user-supplied V0.1 baseline preserved separately.

### Prior source results

- **119 passed, 0 failed, 0 errors, 0 skipped** on Python 3.13.5 / Tcl-Tk 8.6.16 (8.78 seconds).
- The same 119 tests passed on Python 3.12.14 / Tcl-Tk 9.0.4 (8.46 seconds).
- Seven tests exercised actual Tk windows through a local Xvfb, including scan, inspection, SQLite persistence, cached reload, direction swap, English/Korean switching, stale/corrupt cache recovery, worker failure, and window lifetime/closure during a worker.
- Synthetic tests exercised crop, resize, rotation, exposure, luminance zones, Lab/HSV/HSL shifts, confidence/unknown evidence, rejected pairs, invalid ICC profiles, input hashes, GPS exclusion, and V0.1 migration/transaction rollback.
- One end-to-end analysis check rejects every Python socket request; analysis and SQLite persistence complete without network access.
- `pip check` reports no broken dependencies. The exact runtime/development dependency files were installed into a fresh environment and repeated successfully.
- Original image SHA-256 bytes remain unchanged during analysis and inspection. The existing Stone-Quotation repository remains unchanged.

There are 12 non-failing warnings from the pre-existing scanner's Pillow `getdata()` usage, which Pillow plans to remove in version 14. The lock pins Pillow 12.3.0. These warnings were retained, not suppressed.

## Reproduce the full desktop run in the prepared cloud machine

```bash
cd /workspace/Personal-Color-Lab
FONTCONFIG_FILE=/workspace/.tools/personal-color-lab-fonts.conf \
PERSONAL_COLOR_LAB_XVFB=/workspace/.tools/personal-color-lab-xvfb/usr/bin/Xvfb \
.venv-desktop/bin/python tools/run_gui_tests.py -q
```

The cloud's default Python/Tk 9 build lacks TrueType/CJK rendering. The prepared desktop environment uses the already installed system Python 3.13/Tk 8.6, existing Noto CJK fonts, and a writable local Fontconfig cache. English and Korean inspector screenshots were rendered and visually inspected successfully. This is environment selection, not a change to the app's translation strings. The Xvfb package was downloaded through a signature-verified Debian repository and extracted locally; no system packages or signature/TLS verification were modified.

On a normal desktop, follow README.md's venv/lockfile instructions, then run `python -m pytest` with a working display. On headless Linux, `python tools/run_gui_tests.py -q` requires Xvfb in PATH or `PERSONAL_COLOR_LAB_XVFB`. Without a display, the seven desktop tests are explicitly skipped; that is not a substitute for the complete run above.

## Limits

These earlier results validate synthetic photo pairs and Linux source execution. The installer milestone above adds separate artifacts and verification. Real user photo datasets, calibrated confidence, native Windows/macOS releases, RAW decoding, complete XMP parsing/export, style learning/application, publication and fresh-task restoration remain unverified or unimplemented. The source ZIP is a development handoff; the separate .exe/.pkg files are installers. Untagged JPGs assume sRGB; unreadable embedded profiles withhold photometric estimates.
