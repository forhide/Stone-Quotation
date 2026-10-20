# Personal Color Lab V0.6.0 validation

**1374 passed, 0 failures, 0 errors, 0 skipped**, warnings treated as errors, in 327.36 seconds. Final JUnit is included. This is Linux source/runtime validation; target-platform execution limits are listed below.

## Travel workflow and current optimization

- The actual travel workspace imports folder projects, virtualizes its photo sheet, persists keep/hold/reject choices and temporary photo corrections, previews a selected RAW/JPG and exports new JPG copies on a durable serial queue. EN/KO layout tests exercise 1×/1.5×/2× synthetic display densities. GUI checks include the primary entry, actual JPG export, completed-task resume and project reopening.
- Source and isolated installed travel diagnostics each process 500 generated 160×96 JPGs for listing/grouping/persistent thumbnails, then use separate generated JPG and Bayer DNG inputs for real model-enabled batch output. Reopening thumbnails decodes zero new images; RAM thumbnail counts remain bounded. This is not 500 full-resolution RAW processing or a native M1 benchmark.
- Tests inject failures before/after ready publication, expired/live leases, legacy cancellation, changed originals and unrelated output collisions. Tasks snapshot their look/settings/source/runtime; completed receipts are reused. Held/rejected photos stay out of new tasks. The temporary EV/relative Lab warmth/tint/strength layer does not mutate saved Style DNA.
- Eight real-model generated-fixture render comparisons against checksum-verified V0.5.6 show exact rendered/decoded-JPEG pixels and workload-specific 1.51–2.17× medians. See PERFORMANCE.md and travel-render-benchmark.json for sizes/call counts. No claim is made for first-read RAW demosaicing, native M1 memory or a complete camera library.
- App0.6.0 adds atomic SQLite4 travel tables while preserving prior records; source analysis and DNA engine remain0.5.6. Sequence groups are review suggestions. Automatic photo-base normalization, manual group split/merge, approved learning feedback and real per-photo Lightroom sidecars remain future work.

## Parameter learning and rendering

- Analysis now exposes contrast, saturation, Vibrance, HSL, local contrast and texture evidence alongside brightness/WB. Seven pair cards and six folder cards distinguish recorded settings, inferred changes, final appearance and unavailable measurements. The applied-parameter panel reports the adapted recipe at the chosen strength, with unsupported recorded parameters explicitly marked XMP-only.
- RAW+XMP records supplied controls. Clarity, Texture, sharpening radius/masking, luminance and color noise reduction have bounded CPU implementations and supported XMP mappings. Dehaze and other unimplemented recorded controls can be passed into XMP, with no claim they alter preview/JPG pixels. Rendering remains approximate and is not pixel equivalent to Adobe.
- RAW/JPG and JPG/JPG use registered color/tone residuals plus bounded multiscale structural evidence. A robust saturation/Vibrance fit separates global saturation from supported hue-band residuals. Alignment, resampling, clipped/flat data, noise and content confounders can withhold detail controls; inferred values are not recovered Lightroom slider histories.
- A bounded joint tone/spatial fit separates supported local contrast from the applied global curve to prevent duplicate contrast. The original observed curve/statistics remain intact. Independent generated RAW/JPG fixtures cover spatial changes, global-only contrast/curves and combined nonlinear tone plus local detail; the parameter reports retain the actual component errors and limitations.
- Reference JPGs measure final local contrast and texture. At least three distinct eligible originals support conservative appearance adaptation. Reference images do not create arbitrary sharpening, noise or grain edit histories. Duplicate support and scene-diversity damping remain conservative.
- Preview, region rendering, hybrid mixing, category recipes and final JPG rendering share the spatial controls. Strength zero preserves pixels, originals remain unchanged and cancellations prevent normal partial output. Existing photo-specific lens geometry stays outside learned styles.
- Current Style DNA4/engine0.5.6 and scene-profile2 validate parameter/support fields. Legacy DNA1/2/3 upgrade without changing supplied data, with newly introduced detail controls neutral to preserve historical rendering. SQLite4 adds travel records; source-analysis/profile schema1 remains. Prior analysis snapshots remain readable; reanalysis adds new detail evidence.

## Executed source and installed checks

- `travel-workflow-validation.json`: 4 executed check groups; runtime `source_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `windows-x64-travel-validation.json`: 4 executed check groups; runtime `installed_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `photo-parameter-validation.json`: 21 executed check groups; runtime `source_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `windows-x64-parameter-validation.json`: 21 executed check groups; runtime `installed_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `photo-scene-validation.json`: 6 executed check groups; runtime `source_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `windows-x64-scene-validation.json`: 6 executed check groups; runtime `installed_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `semantic-model-validation.json`: 4 executed check groups; runtime `source_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `windows-x64-semantic-validation.json`: 4 executed check groups; runtime `installed_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `raw-pipeline-validation.json`: 6 executed check groups; runtime `source_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `windows-x64-raw-validation.json`: 6 executed check groups; runtime `installed_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `lens-pipeline-validation.json`: 6 executed check groups; runtime `source_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `windows-x64-lens-validation.json`: 6 executed check groups; runtime `installed_runtime`; network `denied`. See the attached observations and limits rather than interpreting these development fixtures as a broad accuracy benchmark.
- `source-gui-validation.json`: 74 actual GUI checks, including travel export/reopen, parameter evidence and collapsible Studio controls.
- `windows-x64-gui-validation.json`: 74 actual GUI checks, including travel export/reopen, parameter evidence and collapsible Studio controls.

## Installer validation

- The three staged apps match the frozen 135-file inventory (18,246,164 bytes), SHA256 `67f1d025f7109999fa5f60177813e26c2548aa1cbda83dc4346df31dff742ed1`. Staging checks compare application bytes; they do not claim native installation.
- Windows binary passes Wine10 silent install/reinstall, 9 launcher self-test groups, installed GUI and isolated installed diagnostics, followed by data-preserving uninstall. Wine is Windows-binary execution on Linux; native Windows hardware was not exercised.
- Wine verification explicitly uses native UCRT and the VCOMP140 DLL already bundled in pinned rawpy (ucrtbase=n,b;vcomp140=n,b). Wine builtin VCOMP left RAW rows unprocessed; the OpenMP repair adds no Wine-specific product branch and does not weaken fixtures or assertions. V0.6.0 separately fixes Windows write-capable output flushing and unavailable optional no-follow cache timestamp updates. A separate generated-sensor proof records byte-identical Linux/installed-Windows RAW RGB, plus the staged/installed native DLL hash. This is a validation-environment repair, without a new DLL download or native-hardware accuracy claim.
- `PersonalColorLab-0.6.0-windows-x64-setup.exe`: 62,204,033 bytes; SHA256 `111cf6e94ea23d3ee0513310c03153cb8f90d856100da0bd6bfc1067c36d7087`.
- `PersonalColorLab-0.6.0-macos-arm64.pkg`: 97,125,194 bytes; SHA256 `a30f1cb0e1c0a4f60bfb516f4822ea631319a62ce580432310e86390e999d38f`.
- `macos-arm64`: 9 structural checks. Apple Installer, Mach-O execution and Retina rendering were not executed. Builds are unsigned and not notarized; OS verification warnings can remain. The embedded component-data repair is preserved, with native M1 confirmation pending.
- `PersonalColorLab-0.6.0-macos-x64.pkg`: 78,467,308 bytes; SHA256 `f5fa77fc5806a0f1121d82b46a774b6b7f91a42119e21b01afae5e7f720cc5de`.
- `macos-x64`: 9 structural checks. Apple Installer, Mach-O execution and Retina rendering were not executed. Builds are unsigned and not notarized; OS verification warnings can remain. The embedded component-data repair is preserved, with native M1 confirmation pending.

## Retained models and material limits

- The offline scene, object, person/face and official Lensfun bundles and their licenses remain embedded. CPU inference uses OpenCV; runtime does not call APIs or download models. Automatic scene similarity is uncalibrated, can abstain and cannot establish clock time solely from indoor brightness. Actual portrait/food execution fixtures establish those routes, not universal taxonomy accuracy.
- Sony A7CR/ILCE-7CR equipment is recognized, but the official bundled database has no FE16–35mm F2.8 GMII distortion calibration. Exact identity is retained without substituting GM I. Full active sensor geometry is assumed; APS-C/digital crop, vignetting, TCA, fisheye, perspective and Adobe LCP remain unimplemented/unverified. Embedded DNG geometry guards uncertain additional warps without claiming LibRaw applied them.
- RAW baseline remains full AHD/camera WB/sRGB/no automatic brightening. Explicit fast preview is approximate; final JPG uses one full baseline development. Native LibRaw/model calls already running cannot be interrupted inside the native call. XMP omits Adobe local masks, composition changes and Lensfun warps.
- Current travel measurements and retained V0.5.3 evidence cover different workloads and do not establish native OS or whole-library speed. Abrupt termination during an exclusive-copy output fallback can leave a partial new output; recovery refuses to adopt or overwrite a mismatching destination.

## Screenshots and image handling

- Screenshots show the actual app. NASA public-domain astronaut imagery appears in applicable recognition/scene captures, from scikit-image; attribution https://github.com/scikit-image/scikit-image/blob/v0.19.3/skimage/data/_fetchers.py . External coffee/OpenCV probes are test-only and are not redistributed. Other examples use synthetic data. No user photos, complete EXIF, GPS, API credentials or library paths are included in portable style reports.
- This download branch is separate from the existing repository main and prior download branches.
