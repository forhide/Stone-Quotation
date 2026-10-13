# Personal Color Lab V0.5.4 performance notes

The tables below retain **V0.5.3 historical measurements**, comparing V0.5.2 algorithms with the V0.5.3 paths in this Linux cloud environment. They do not measure V0.5.4's equipment metadata parsing, calibration verification, edge fitting or lens warp. Enabling lens correction changes geometry and adds work; no new end-to-end speedup or exact-output claim is made for that optical stage.

Fixtures are generated images and uncompressed Bayer DNGs. These results do not establish native M1, Intel Mac, Windows, real-camera corpus or whole-application speed. The RAW decoder, RAW export and render measurements cover different work; their speedups must not be multiplied. Historical RAW-decoder/module SHA fields identify the V0.5.3 source used for those runs, not the changed V0.5.4 metadata/correction integration. Exact historical reproduction requires that V0.5.3 source and its captured baselines.

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

Whole-module SHA fields in the render report are integration-time snapshots. The measured function hash is `38b0b329f13f5fa50bca69e7df56b16c0d86e9eb6e3e881ac0177b2d10bfa320`. `pcl_verify_kernel_hash_053.py` verifies the current code by selecting 12 top-level render functions, joining their `ast.get_source_segment` results in source-file order with one LF, then hashing UTF-8 bytes without a trailing LF. Function comments/formatting are included; imports and photo-read/preview/export integration functions are excluded. The helper lists the exact function set and fails on mismatch.

## Retained V0.5.2 improvements

V0.5.2 versus V0.5.1 measured byte-identical render gains of 1.40×/2.50× at 1200×800 and 1.50×/2.34× at full-size global/regional workloads. Those runs used three alternating warmed measurements and retained the same resolution. Identity operations, component plans, bounded hybrid baselines and face bounding rectangles were optimized. These historical results remain in the V0.5.2 evidence bundle and are separate from the new table.

The unchanged V0.5.2 reference/global analysis improved 30.3% on its deterministic 2000×1333 JPEG with numerically identical statistics; `ANALYSIS_PERFORMANCE.md` retains the method and bounded-allocation tradeoff. Recognition comparison on three external test-only fixtures measured 6.50% less detection time and 7.89% less regional-measurement time with identical reports/masks. Models, thresholds and resolutions remain unchanged; tested lower OpenCV thread counts were slower and were not shipped. Studio thumbnails reuse decoded pixels/masks, and display-only wipe dragging avoids reanalysis; this is functionally tested, without an FPS claim.

The retained V0.5.3 `performance-evidence.zip` contains reports, captured baselines, benchmark/hash helpers and reproduction instructions, without photo/DNG/NPY payloads. Synthetic inputs are regenerated locally. V0.5.4 adds ExifRead3.5.1 and local Lensfun XML/license data while preserving original-file protection, sRGB/GPS behavior and strict final-output development. There is no runtime network, API, model or calibration download.

## V0.5.5 scene inference scope

The category encoder is an additional stage; prior V0.5.3 renderer/RAW figures do not measure it. Static per-channel INT8 weights reduce the image model to8,626,306 bytes; the four verified scene assets total8,719,943 bytes. Quantization comparisons against upstream FP32 on six external execution probes are included in scene-model-quantization-validation.json, separately from classification accuracy.

A reviewed label change reuses developed source pixels, measurements and automatic evidence. Source cache identity includes algorithm/classifier/model provenance; manual annotations never alter shared automatic cache entries. Photo tiles use the prepared category recipe without another model forward. Native model/LibRaw operations already running are only cancellable at their boundaries. No whole-app/native-platform speed claim follows from these fixtures.
