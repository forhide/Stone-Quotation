# Personal Color Lab V0.4.0 validation

**468 passed, 0 failures, 0 errors, 0 skipped, no test warnings**, in 44.68 seconds on Linux/Python 3.13.5/Tcl-Tk 8.6.16. The complete source/GUI/archive run and current JUnit are included. Locked development requirements passed pip check.

## Verified behavior

- RAW + JPG, RAW + XMP and JPG-only references retain their distinct evidence contracts and original byte hashes.
- Style DNA adapters, 12 builtins, strength-zero identity, bounded deterministic rendering, reference adaptation, observed pair matching, recorded master/RGB curves and grayscale, hybrid endpoints and explicit composition choices.
- Full-resolution JPEG copies preserve originals, include sRGB ICC and strip EXIF/GPS. Existing files cannot be overwritten; source changes and cancellation fail safely. XMP exports parse supported global curves/settings; JSON round trips use strict schemas and size/depth/range limits.
- Bounded content caches avoid repeated decoding and exact duplicates, invalidate changed inputs/versions, reject corrupt or mismatched evidence, relocate RAW/XMP companion paths correctly and retain near-duplicates for review.
- SQLite migration and persistent analysis/recipe reopening preserve prior library rows. App/analysis0.4.0; database3; analysis/profile/DNA schema1. Historical 0.3.0 source snapshots remain readable. Older apps reject database3.
- Real Tk tests cover three analysis-to-application routes, both languages, style previews/mixing/strength/exports/saved recipes, minimum layouts at100/150/200% synthetic density and closing during a worker. Python network access is denied in package and full GUI diagnostics. Both locales contain463 matching messages.

## Final installers

All three installers bundle verified private CPython3.13.16/Tcl-Tk, four architecture-matching native wheels and retained licenses. No target Python install or runtime network download is needed.
- `PersonalColorLab-0.4.0-windows-x64-setup.exe`: 51,093,051 bytes; SHA-256 `cffdd6fa5a97092c218de626cd0a3b121fb58949d54c95aa96399deb15ac7bfb`.
- `PersonalColorLab-0.4.0-macos-arm64.pkg`: 85,730,702 bytes; 2,430 payload entries; SHA-256 `62b9bbea4705ea2b92936188f6769e862df375b32e0892f916516e42dfad2224`.
- `PersonalColorLab-0.4.0-macos-x64.pkg`: 67,072,888 bytes; 2,339 payload entries; SHA-256 `9fd206f3638ce13bc6106eca2887f6fcabf3c184a58a48f7e6b1516f62e7affd`.

The final Windows binary passed Wine10 silent install/reinstall, installed-launcher self-test, actual installed Tk workflows and data-preserving uninstall. GUI checks include three source modes, all prior pair/cache/Korean routes and the new style studio, zero strength, hybrid preview, full-resolution JPG/XMP/JSON exports and recipe reopening. DPI awareness is2; body11points and small10points. Data and unrelated-file sentinels survived uninstall. Test-only Wine UCRT is not shipped. This is Windows binary execution on Linux, not native Windows hardware.

Both Mac products pass nine independent checks: embedded component resolution, matching Distribution/PackageInfo identity/version, required PackageInfo/Bom/Payload installation data, XAR extraction checksums, complete CPIO bytes, modes, internal symlinks, BOM paths/modes/root-admin ownership and PackageInfo count. The #application.pkg repair remains included. ARM requires macOS13+; Intel14+. Native Apple Installer and Mach-O application execution were not performed.

## Limits

Installers are unsigned development builds. Native Windows/macOS installation, Apple Gatekeeper/signing/notarization, Retina/monitor transitions and native CI remain unverified. The reported M1 missing-installation-data fix passes structural checks, but native installation confirmation is pending.

XMP presets are approximate supported global controls, not proof of identical Adobe pixels or a validated Lightroom-version import. Local masks/custom profiles, exact recovered Lightroom sliders, semantic scene/face/sky models, perspective/subject-aware composition, calibrated confidence and every-camera RAW evaluation are not implemented. Reference appearance includes subject/lighting. Lighting adaptation uses pixel low/mid/high-key groups and needs sufficient samples. Composition implements centered aspect ratio only and defaults to color-only. Synthetic tests/captures are not a real-photo quality benchmark.

Actual synthetic running-app screenshots, per-target JSON, installed diagnostic reports, JUnit, SHA256 and a byte-verified source ZIP accompany the release.
