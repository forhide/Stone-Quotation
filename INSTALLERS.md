# Personal Color Lab 설치 안내

V0.5.1은 세 분석 방식으로 추출한 스타일을 새 JPG/RAW에 적용합니다. 전후 미리보기, 강도 조절, 스타일 혼합, 기본 스타일 12개, JPG 사본·XMP 프리셋·스타일 JSON 내보내기를 제공합니다. Python·Tcl/Tk·Pillow·NumPy·OpenCV·rawpy/LibRaw를 포함하므로 Python을 따로 설치할 필요가 없습니다. 객체 인식·사람 분할·얼굴 검출 ONNX 모델 3개가 설치 파일에 포함되며 CPU에서 실행됩니다. 설치 후 인터넷, API, 토큰 결제, 모델 다운로드가 필요 없습니다. XMP는 지원 전역 설정의 근사 프리셋이며 Adobe와 동일한 현상 결과를 보장하지 않습니다.

| 운영체제 | 대상 | 최소 버전 | 파일 |
| --- | --- | --- | --- |
| Windows | Intel/AMD 64비트 | Windows 10/11 | `PersonalColorLab-0.5.1-windows-x64-setup.exe` |
| macOS | Apple Silicon | macOS 13 | `PersonalColorLab-0.5.1-macos-arm64.pkg` |
| macOS | Intel | macOS 14 | `PersonalColorLab-0.5.1-macos-x64.pkg` |

각 파일의 `.sha256` 체크섬을 함께 제공합니다. macOS 최소 버전은 포함한 라이브러리 wheel의 지원 범위를 따릅니다. Windows ARM 에뮬레이션은 검증하지 않았습니다.

V0.5.1은 흑백 참고 사진과 원본·편집본에서 확인한 흑백 의도를 새 사진에 유지합니다. 예전 사진 쌍 분석은 다시 분석하면 새 흑백 증거가 추가됩니다. 혼합 색상·세피아 사진은 흑백으로 단정하지 않습니다. 분석 캐시 복구, 작업 취소, 내보내기 파일 정리, 언어 전환과 설정 스크롤도 수정했습니다.

## Mac 설치 데이터 오류 수정

V0.3.0에서 보안 경고 이후 설치 데이터를 찾지 못하는 문제가 보고됐습니다. V0.3.1의 내장 패키지 참조 수정은 V0.5.1에도 포함됩니다. 새 V0.5.1 파일을 내려받으세요. 예전 파일과 이름이 다릅니다. M1·M2 등은 Apple Silicon용이며 macOS 13 이상이 필요합니다. 이 수정은 설치 데이터 경로를 고칩니다. Apple 서명·공증 경고는 별도이며 실제 Mac 설치 완료 확인은 아직 남아 있습니다.

## 설치·업데이트·제거

Windows: setup 파일을 열어 설치하세요. 기본 위치는 `%LOCALAPPDATA%\Programs\PersonalColorLab`이며 관리자 권한을 요구하지 않습니다. 시작 메뉴의 **Personal Color Lab**으로 실행합니다. Windows 설치된 앱 목록이나 시작 메뉴의 **Uninstall**로 제거합니다. 설치 프로그램의 영어·한국어 선택은 앱 언어와 별개입니다. 앱은 처음 실행할 때 영어를 사용하며 한국어를 선택할 수 있습니다.

macOS: CPU에 맞는 `.pkg`를 열어 설치하세요. 관리자 인증 후 `/Applications/Personal Color Lab.app`을 설치하며 Python은 앱 내부에만 포함됩니다. Finder의 응용 프로그램 폴더에서 실행합니다. 제거할 때는 이 앱을 휴지통으로 이동하세요.

업데이트 전에 앱을 종료하고 새 설치 파일을 실행하세요. 기존 DB와 설정은 Windows `%USERPROFILE%\.personal_color_lab` 또는 macOS `~/.personal_color_lab`에 유지됩니다. `PERSONAL_COLOR_LAB_DATA_DIR` 설정도 지원합니다. 설치·업데이트·제거는 사용자 데이터와 사진 원본을 삭제하지 않습니다. DB 스키마3은 유지됩니다. 새0.5.1 분석 프로필은 이전 앱이 해석하지 못하며, 스타일 DNA2는0.5.0과 호환됩니다.0.4 이하 앱은 DNA2를 읽지 못하므로 낮은 버전으로 돌아가기 전에 데이터 폴더를 백업하세요. Windows 제거 프로그램은 설치한 파일만 삭제하여 설치 폴더에 별도로 추가한 파일도 보존합니다.

V0.5.1의 앱·분석 알고리즘 버전은0.5.1, DB 스키마는3, 분석 결과 스키마는1, 스타일 DNA는2/엔진0.5.0입니다. DB는 기존 기록과 설정을 보존하며 업그레이드합니다. 이전 알고리즘의 비교 결과는 보존하지만 현재 결과를 얻으려면 다시 분석해야 합니다. 저장한 스타일은 당시 분석의 스냅샷이며 다시 열 때 원본을 자동으로 재분석하지 않습니다.

Windows는 앱 창을 만들기 전에 DPI 처리를 설정하고 처음 열린 화면의 배율에 맞춰 글씨와 간격을 조절합니다. macOS는 시스템 글꼴과 번들 Tk의 기본 Retina 처리를 사용합니다. 실제 Windows·macOS 화면의 DPI·Retina 검증은 남아 있습니다. 글씨나 화면 배율이 높으면 더 넓은 작업 화면이 필요할 수 있습니다.

이 빌드는 코드 서명 및 Apple 공증을 하지 않았으므로 운영체제 확인 경고가 나타날 수 있습니다. 출처와 체크섬을 확인하세요. macOS에서 차단된다면 시스템 설정의 개인정보 보호 및 보안에 표시되는 해당 설치 파일의 **확인 없이 열기**로 진행할 수 있습니다. 정식 공개 배포 전에는 네이티브 검증과 서명·공증을 완료해야 합니다.

## 검증과 진단

완료한 Linux 소스·GUI·아카이브 테스트와 Windows Wine, macOS XAR·BOM·CPIO 검사 결과는 버전별로 `VALIDATION.md`에 기록합니다. 두 OS 실제 기기의 설치·GUI 검증과 서명·공증은 남아 있으며 네이티브 CI는 아직 실행하지 않았습니다. Wine이나 패키지 구조 검사는 실제 기기 검증을 대신하지 않습니다.

앱의 진단 모드는 합성 사진과 임시 DB로 번역·네이티브 라이브러리·Tcl·사진 분석을 검사하며 사용자 사진과 기존 DB는 사용하지 않습니다.

```powershell
& "$env:LOCALAPPDATA\Programs\PersonalColorLab\Personal Color Lab.exe" --self-test --self-test-report "$env:TEMP\pcl-check.json"
```

```bash
"/Applications/Personal Color Lab.app/Contents/MacOS/Personal Color Lab" \
  --self-test --self-test-report /tmp/pcl-check.json
```

## 폴더를 선택한 다음

1. **Choose folder**로 폴더를 선택하면 분석 창이 열립니다. **RAW + JPG / RAW + XMP / JPG references** 중 사용할 입력 방식을 확인하세요. JPG만 있는 폴더는 원본 없이 참고 사진의 색감 경향을 분석합니다.
2. **Review files**에서 필요 없는 파일을 제외하세요. RAW의 짝이 없거나 여러 후보가 있으면 **Choose matching file**로 직접 선택합니다. 파일 이름이 맞아도 같은 사진의 원본·편집본인지 확인하세요.
3. **Analyze selected files**를 누르세요. 진행 상황과 실패한 파일을 확인할 수 있습니다. **Cancel**을 누르면 현재 파일을 마친 뒤 중단하며 완료한 결과는 남습니다.
4. **Style summary**와 개별 결과를 확인하고 **Style name**을 입력한 뒤 **Save style**을 누르세요. 앱을 다시 실행한 후에도 **Saved styles**에서 열 수 있습니다.

RAW + JPG는 센서 RAW를 카메라 화이트밸런스·자동 밝기 보정 없는 고정 sRGB 기준으로 현상한 다음 편집 JPG와 비교합니다. Lightroom의 실제 슬라이더를 복원한 값은 아닙니다. 지원 카메라는 LibRaw에 따르며 손상되거나 지원하지 않는 RAW는 실패로 표시합니다.

RAW + XMP는 지원하는 전역 Camera Raw 설정과 RGB 톤 곡선을 읽습니다. 누락된 값은 알 수 없는 값으로 유지하고, 마스크·사용자 프로필·Adobe 현상 결과는 재현하지 않습니다. 선택한 XMP가 해당 RAW의 설정인지 직접 확인해야 합니다.

JPG만 분석하면 밝기·대비·채도·색상대·대표색과 공통 경향을 표시합니다. 동일한 바이트의 중복 파일은 한 번만 반영하고 각 사진에 같은 가중치를 줍니다. 일관성과 편차·표본 부족·특이한 사진도 살펴볼 수 있지만 지원하는 객체 검출로 장면 태그를 만들며, 전체 장면 분류나 실제 보정 이력을 복원하지는 않습니다. 원본 촬영 조명과 피사체 색도 결과에 포함됩니다.

기존 **Compare two photos**는 원본 JPG와 편집 JPG를 직접 고르는 비교 방식으로 유지됩니다. 파일 이름·폴더가 달라도 되며 미리보기에서 방향을 확인하고 밝기 변환 곡선과 상세 측정값을 볼 수 있습니다. 앱 언어는 설정에서 한국어로 바꿀 수 있습니다.

## 다시 빌드하기

빌드 단계만 네트워크를 사용합니다. CPython 3.13.16은 Astral 공식 python-build-standalone `20261003` 릴리스에서 고정 SHA-256을 확인하여 받습니다. 전체 런타임 배포물의 네이티브 라이브러리 라이선스를 포함합니다. 분석 라이브러리는 `requirements.lock`과 PyPI SHA-256을 확인합니다. rawpy 0.25.1의 대상별 wheel에는 LibRaw 0.21.4를 포함하며 해당 라이선스도 함께 전달합니다. build 도구와 pip/ensurepip는 앱에 포함하지 않습니다.

```bash
python -m pip install -r requirements-build.lock
python tools/download_runtimes.py
python tools/download_wheels.py
python tools/build_installers.py --target windows-x64
python tools/build_installers.py --target macos-arm64
python tools/build_installers.py --target macos-x64
```

Windows 빌드는 NSIS 3.11 이상의 `makensis`가 필요합니다. macOS에서는 Apple `pkgbuild`·`productbuild`를 사용합니다. Linux에서 `.pkg`를 생성하려면 [bomutils](https://github.com/hogliux/bomutils)의 `mkbom`과 POSIX `cksum`이 필요하며 `--mkbom /path/to/mkbom`으로 지정합니다. 숨김 `.dylibs`도 BOM에 포함되도록 명시적 파일 목록을 전달합니다. 결과와 체크섬은 `dist/installers`에 생성됩니다. 준비된 리소스가 있으면 `build_installers.py`는 오프라인으로 실행할 수 있습니다.

실제 운영체제에서 빌드·설치·번들 진단·GUI·제거를 확인하는 `.github/workflows/installers.yml`을 포함했습니다. 프로젝트 저장소에 저장한 후 **Build and test desktop installers** 워크플로를 수동 실행하세요. 각 아키텍처에 맞는 러너를 사용하며 테스트 데이터만 사용합니다. 현재 ZIP에서 받은 소스 폴더는 별도 Git 원격 저장소에 연결하지 않았습니다. 사용자가 지정한 `forhide/Stone-Quotation`의 다운로드용 브랜치는 설치 파일 전달 용도이며 앱 소스·CI 저장소가 아닙니다.

## 내장 인식 모델

빌드 전에 `python tools/download_models.py`로 고정된 OpenCV Zoo 커밋의 공식 Git LFS 크기·SHA-256과 대조한 모델을 준비합니다. 이 다운로드 도구는 설치된 앱에 포함하지 않습니다. 이미 준비한 파일로는 네트워크 없이 빌드할 수 있습니다. 빌더는 모델/라이선스 누락 또는 해시 불일치 시 중단합니다. NanoDet와 PP-HumanSeg는 Apache2.0, YuNet는 MIT 라이선스이며 설치 패키지에 전문을 포함합니다. 모델은 `runtime/.../site-packages/personal_color_lab/assets/models` 안에 포함됩니다.

JPG에는 객체별·얼굴 보정이 반영됩니다. XMP는 전역 설정만 내보냅니다. 사람 외 객체의 영역은 박스 근사이며, 하늘·풍경 전체 분할과 Adobe 객체 마스크 이식은 지원하지 않습니다. 얼굴은 위치만 검출하며 신원·성별·인종 등을 인식하지 않습니다.
