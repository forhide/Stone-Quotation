# Personal Color Lab V0.6.1 performance notes

## V0.6.1 presentation scope

V0.6.1 changes interface consistency and when UI work is requested. In the travel workspace, changing a selection in the photo sheet no longer starts a styled RAW preview; that work starts when Before / after is opened. Gallery navigation still uses its bounded approximate thumbnail cache, and final exports retain strict full-quality processing and source hashes.

Queue presentation selects only task/photo names, statuses and error codes, then updates stable rows incrementally. It avoids parsing every full frozen Style DNA request on Tk’s thread and preserves selection/scroll. The export worker still reads and validates the full immutable request and source/runtime identities. This is an implementation change, not a measured latency, peak-memory or RAW-decoding speed result.

No rendering, analysis, model, runtime dependency or database-schema version changes. The V0.6.0 benchmark and its comparison with V0.5.6 are retained below, not rerun as a V0.6.1 benchmark. Their generated fixtures do not establish native M1/Windows performance or 500 A7CR RAW throughput. Current functional/source/installed results belong in VALIDATION.md.

## Retained V0.6.0 exact rendering reuse

Measured on this Linux cloud machine with generated 1600×1064 JPGs and Bayer DNGs, real embedded CPU models, OpenCV one thread, warm processes and three repeats. The baseline renderer is extracted from the checksum-verified V0.5.6 source archive. Current source/pixel hashes and strict RAW quality remain required; approximate gallery images never supply rendering evidence. Existing slider `base=` reuse was already present and is not this benchmark’s gain.

| Workload | V0.5.6 median | V0.6.0 median | Speedup |
| --- | ---: | ---: | ---: |
| jpg-revisit-global | 5.016s | 2.326s | 2.16× |
| jpg-revisit-objects | 5.527s | 2.544s | 2.17× |
| jpg-preview-export-global | 3.534s | 2.346s | 1.51× |
| jpg-preview-export-objects | 4.054s | 2.413s | 1.68× |
| raw-revisit-global | 5.182s | 2.580s | 2.01× |
| raw-revisit-objects | 5.754s | 2.764s | 2.08× |
| raw-preview-export-global | 3.585s | 2.328s | 1.54× |
| raw-preview-export-objects | 3.961s | 2.551s | 1.55× |

Revisit cases alternate two photos six times without a prepared base. Preview/export cases process two photos with a precise preview immediately before each full-quality JPG export. Measured rendered and decoded-export pixels match exactly in all eight cases. Cache misses, different RAW quality/pixels/optics/model bundles and source byte changes recompute evidence. Strict preview→export benefits occur only when the bounded measurement pixels match exactly; fast preview never qualifies as a strict RAW baseline. The small two-entry/32MiB process cache stores evidence, not full source photos.

The report `travel-render-benchmark.json` includes call counts, fixture sizes, medians, repetitions and baseline hashes. RAW decoding and full-resolution styling still run when needed; this is reuse of repeated measurement/classification/inference, not a faster LibRaw demosaicing algorithm. Do not multiply these gains by historical kernel/decoder benchmarks.

A separate `travel-workflow-validation.json` probe imports 500 generated 160×96 JPGs, builds/reopens persistent thumbnails and suggests bounded adjacent groups. Reopening all thumbnails performs zero additional image decodes and uses at most 32 RAM thumbnail entries. Its one-run timings describe small generated JPGs, filesystem warm state and this machine. They do not measure 500 A7CR RAWs, photographic group accuracy or native M1 throughput. The actual UI keeps visible cells and at most 64 Tk thumbnails.

The default final queue uses one full-resolution render at a time per project, with cancellable chunked hashes and durable receipts. A running native LibRaw/model call must return before cancellation. Several simultaneously opened projects can still raise memory use; real 61MP/M1 peak memory and wall-clock speed remain to be measured. Original-size JPG remains the default, with explicit 2048/3840-long-edge copies resized after styling.

## Retained historical performance


The tables below retain **V0.5.3 historical measurements**, comparing V0.5.2 algorithms with the V0.5.3 paths in this Linux cloud environment. They do not measure V0.5.4's equipment metadata parsing/calibration/warp, V0.5.5's scene encoder or V0.5.6's parameter fitting and spatial filters. Enabling these stages adds work; these tables make no current end-to-end speedup or exact-output claim.

Fixtures are generated images and uncompressed Bayer DNGs. These results do not establish native M1, Intel Mac, Windows, real-camera corpus or whole-application speed. The RAW decoder, RAW export and render measurements cover different work; their speedups must not be multiplied. Historical RAW-decoder/module SHA fields identify the V0.5.3 source used for those runs, not the changed current integration. Exact historical reproduction requires that V0.5.3 source and its captured baselines.

V0.5.4 retains tiled render kernels and uses bounded inverse-map tiles for supported radial correction. JPG export still develops full RAW once and derives the corrected AREA adaptation preview; quality/mode/manual equipment/calibration identity prevents reuse of incompatible pixels or masks. These are implementation and regression properties, not measured V0.5.4 timing or peak-memory improvements. Completed functional and installed-runtime checks belong in VALIDATION.md.

## RAW decoding and preview quality

Strict AHD decoding remains the default for analysis and preview, and final JPG/XMP preparation always uses the strict baseline. Camera white balance, sRGB gamma, sensor normalization, disabled automatic brightness and orientation are preserved. Header-first validation rejects oversized inputs before unpacking. The fast preview is an explicit optional approximation for eligible Bayer inputs; unsupported inputs retain the strict path.

One warmup plus five timed open/unpack/develop/resize reads per mode, each mode in an isolated process; rawpy 0.25.1/LibRaw 0.21.4, requested 1200px preview, existing OpenCV 4 threads unchanged:

| Generated fixture | V0.5.2 strict | V0.5.3 strict | Optional fast preview | Fast speedup |
| --- | ---: | ---: | ---: | ---: |
| 8MP, rotated | 0.356s | 0.372s | 0.075s | 4.74× |
| 12MP, smooth | 0.496s | 0.496s | 0.103s | 4.84× |
| 12MP, fine pattern | 0.472s | 0.463s | 0.105s | 4.50× |

Strict pixels match the previous baseline exactly in all three cases, and strict decoding speed is roughly unchanged. The 4.5–4.8× gain is decoder-only and comes from half-size Bayer development. Fast previews are not equivalent to strict previews: byte-channel MAE is 0.301/0.234 for the first two fixtures, but 7.585 on the fine pattern, with 95th-percentile error 22 and maximum 37 on the 0–255 scale. This visible quality difference is why fast preview is opt-in and excluded from final output preparation. No embedded camera JPEG is substituted for sensor pixels. Detailed timing, quality and process-RSS samples are in `raw-decoder-benchmark.json`.

## RAW full-resolution export

The V0.5.3 14.2MP 4608×3072 synthetic DNG export develops RAW once and derives the adaptation preview from that full decode, instead of developing it twice. Both benchmark arms use the same **V0.5.3 render kernels** and strict decoder, isolating duplicate-decode removal. Recognition is disabled; hashing, adaptation and 95-quality JPEG encoding are included. After warming both paths, three alternating measurements yield **2.890→2.282s**, or **21.05% less time**. All three decoded JPEG comparisons are pixel-identical, retain full dimensions and sRGB profiles, strip EXIF, and preserve the source file. This does not include the separate renderer gains or V0.5.4 lens correction. Details are in `raw-export-comparison.json`.

## Style rendering

OpenCV 1 thread; generated fixed-resolution images, seed 20261012, one warmup per path and five alternating before/after measurements. All four before/after output SHA256 pairs match exactly. The global fixture uses the warm-negative builtin with +0.7EV and a 1.07-scale red-channel curve; the regional fixture mixes warm-negative/teal-amber 60/40 with person, food and background recipes.

| Workload | V0.5.2 | V0.5.3 | Speedup |
| --- | ---: | ---: | ---: |
| 1200×800 global | 0.255s | 0.190s | 1.34× |
| 1200×800 regional hybrid | 1.201s | 0.921s | 1.31× |
| 4000×2600 global | 2.088s | 1.553s | 1.34× |
| 3000×2000 regional hybrid | 6.883s | 4.905s | 1.40× |

Fixed 33-point curves use direct uniform-grid indexing with the original double-precision interpolation arithmetic. Exposure reuses an exact 256-entry sRGB table; eligible identity-tone/zero-exposure channel edits reuse source-value tables. Lab coefficients are prepared once and zero zone shifts are skipped. The 160k-pixel tile bound, grain coordinates, composition, cancellation and partial-strength semantics remain unchanged. The measured 1.30–1.40× range applies to these fixtures and excludes decoding, hashing, model inference and UI work.

`render-precision.json` records 60 exact render SHA pairs spanning 20 recipes and three strengths, including exposure −3…+3, color/Lab/HSL/grain and monochrome. A separate 100-curve test covers 200,099 values per curve, including grid nodes, neighboring float32 values and clamping, with exact float32 agreement against `np.interp`.

Whole-module SHA fields in the render report are integration-time snapshots. The measured function hash is `38b0b329f13f5fa50bca69e7df56b16c0d86e9eb6e3e881ac0177b2d10bfa320`. The retained `pcl_verify_kernel_hash_053.py` selects 12 top-level render functions, joins their `ast.get_source_segment` results in source-file order with one LF, and hashes UTF-8 bytes without a trailing LF. Function comments/formatting are included; imports and photo-read/preview/export integration functions are excluded. This is a check for the captured V0.5.3 source. V0.5.6 changes measurement/effective-recipe/planning functions in that set, so the historical hash does not certify the current renderer or its output.

## Retained V0.5.2 improvements

V0.5.2 versus V0.5.1 measured byte-identical render gains of 1.40×/2.50× at 1200×800 and 1.50×/2.34× at full-size global/regional workloads. Those runs used three alternating warmed measurements and retained the same resolution. Identity operations, component plans, bounded hybrid baselines and face bounding rectangles were optimized. These historical results remain in the V0.5.2 evidence bundle and are separate from the new table.

The unchanged V0.5.2 reference/global analysis improved 30.3% on its deterministic 2000×1333 JPEG with numerically identical statistics; `ANALYSIS_PERFORMANCE.md` retains the method and bounded-allocation tradeoff. Recognition comparison on three external test-only fixtures measured 6.50% less detection time and 7.89% less regional-measurement time with identical reports/masks. Models, thresholds and resolutions remain unchanged; tested lower OpenCV thread counts were slower and were not shipped. Studio thumbnails reuse decoded pixels/masks, and display-only wipe dragging avoids reanalysis; this is functionally tested, without an FPS claim.

The retained V0.5.3 `performance-evidence.zip` contains reports, captured baselines, benchmark/hash helpers and reproduction instructions, without photo/DNG/NPY payloads. Synthetic inputs are regenerated locally. V0.5.4 adds ExifRead3.5.1 and local Lensfun XML/license data while preserving original-file protection, sRGB/GPS behavior and strict final-output development. There is no runtime network, API, model or calibration download.

## V0.5.5 scene inference scope

The category encoder is an additional stage; prior V0.5.3 renderer/RAW figures do not measure it. Static per-channel INT8 weights reduce the image model to8,626,306 bytes; the four verified scene assets total8,719,943 bytes. Quantization comparisons against upstream FP32 on six external execution probes are included in scene-model-quantization-validation.json, separately from classification accuracy.

A reviewed label change reuses developed source pixels, measurements and automatic evidence. Source cache identity includes algorithm/classifier/model provenance; manual annotations never alter shared automatic cache entries. Photo tiles use the prepared category recipe without another model forward. Native model/LibRaw operations already running are only cancellable at their boundaries. No whole-app/native-platform speed claim follows from these fixtures.

## V0.5.6 parameter and spatial-processing scope

Pair detail analysis reuses decoded, registered, tone-corrected RGB instead of opening RAW again. Structural analysis is bounded to a 1024-pixel long edge and 100,000 samples. Saturation/vibrance fitting uses a deterministic subset capped at 20,000 samples with robust iterations; insufficient color variation can leave vibrance unmeasured. These limits bound work without establishing photographic accuracy or a measured speedup.

The spatial renderer prepares coarse/medium detail fields at a 1024-pixel long edge and processes native sharpening and luminance/color noise reduction in 384-pixel tiles with filter halos. Fine-filter radii scale with image size and are capped. Neutral detail profiles bypass filters. Supported scene and hybrid profiles share the effective controls, and the spatial pass runs after global/regional color rendering. Existing cooperative cancellation checkpoints and one-full-RAW-development JPG exports remain requirements; an active native filter call must return before the next cancellation check.

Final JPGs remain full resolution. Local-contrast/texture fields are a bounded approximation, fine detail can differ between resized previews and native exports, and none of these operators reproduces Adobe pixels. New learned effects deliberately change output pixels, so historical byte-equivalent color-render fixtures are not evidence that a new spatial recipe is equivalent to the previous app. Retained legacy DNA uses neutral new controls to preserve its historical behavior.

No new runtime dependency, model, GPU requirement, API or network client is added. Source/installed functional checks and tools/verify_photo_parameters.py reports belong in VALIDATION.md. No V0.5.6 whole-app timing or peak-memory improvement is claimed without a new measured report.
