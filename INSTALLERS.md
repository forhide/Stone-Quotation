# Personal Color Lab 설치 안내

V0.2.0 개발용 설치 패키지입니다. Python·Tcl/Tk·Pillow·NumPy·OpenCV와 영어·한국어 번역을 포함하며 설치 후 오프라인으로 실행합니다. Python 설치나 pip 명령이 필요하지 않습니다. 현재 기능은 JPG 원본/편집본 분석이며 RAW 현상·스타일 적용·XMP 내보내기는 후속 개발입니다.

| 운영체제 | 대상 | 최소 버전 | 파일 |
| --- | --- | --- | --- |
| Windows | Intel/AMD 64비트 | Windows 10/11 | `PersonalColorLab-0.2.0-windows-x64-setup.exe` |
| macOS | Apple Silicon | macOS 13 | `PersonalColorLab-0.2.0-macos-arm64.pkg` |
| macOS | Intel | macOS 14 | `PersonalColorLab-0.2.0-macos-x64.pkg` |

각 파일의 `.sha256` 체크섬을 함께 제공합니다. macOS 최소 버전은 포함한 라이브러리 wheel의 지원 범위를 따릅니다. Windows ARM 에뮬레이션은 검증하지 않았습니다.

## 설치·업데이트·제거

Windows: setup 파일을 열어 설치하세요. 기본 위치는 `%LOCALAPPDATA%\Programs\PersonalColorLab`이며 관리자 권한을 요구하지 않습니다. 시작 메뉴의 **Personal Color Lab**으로 실행합니다. Windows 설치된 앱 목록이나 시작 메뉴의 **Uninstall**로 제거합니다. 설치 프로그램의 영어·한국어 선택은 앱 언어와 별개입니다. 앱은 처음 실행할 때 영어를 사용하며 한국어를 선택할 수 있습니다.

macOS: CPU에 맞는 `.pkg`를 열어 설치하세요. 관리자 인증 후 `/Applications/Personal Color Lab.app`을 설치하며 Python은 앱 내부에만 포함됩니다. Finder의 응용 프로그램 폴더에서 실행합니다. 제거할 때는 이 앱을 휴지통으로 이동하세요.

업데이트 전에 앱을 종료하고 새 설치 파일을 실행하세요. 기존 DB와 설정은 Windows `%USERPROFILE%\.personal_color_lab` 또는 macOS `~/.personal_color_lab`에 유지됩니다. `PERSONAL_COLOR_LAB_DATA_DIR` 설정도 지원합니다. 설치·업데이트·제거는 사용자 데이터와 사진 원본을 삭제하지 않습니다. Windows 제거 프로그램은 설치한 파일만 삭제하여 설치 폴더에 별도로 추가한 파일도 보존합니다.

이 빌드는 코드 서명 및 Apple 공증을 하지 않았으므로 운영체제 확인 경고가 나타날 수 있습니다. 출처와 체크섬을 확인하세요. macOS에서 차단된다면 시스템 설정의 개인정보 보호 및 보안에 표시되는 해당 설치 파일의 **확인 없이 열기**로 진행할 수 있습니다. 정식 공개 배포 전에는 네이티브 검증과 서명·공증을 완료해야 합니다.

## 검증과 진단

Linux 소스·GUI·아카이브 테스트 144개가 통과했습니다. Windows는 Wine 10에서 설치·재설치·번들 진단·실제 GUI 분석·제거·사용자 데이터 보존 검증을 통과했습니다. macOS 두 패키지도 XAR·BOM·CPIO의 모든 파일 해시·권한·아키텍처 검사를 통과했습니다. 두 OS 실제 기기의 설치·GUI 검증과 서명·공증은 남아 있으며 네이티브 CI는 아직 실행하지 않았습니다. 상세 결과는 `VALIDATION.md`에 기록합니다.

앱의 진단 모드는 합성 사진과 임시 DB로 번역·네이티브 라이브러리·Tcl·사진 분석을 검사하며 사용자 사진과 기존 DB는 사용하지 않습니다.

```powershell
& "$env:LOCALAPPDATA\Programs\PersonalColorLab\Personal Color Lab.exe" --self-test --self-test-report "$env:TEMP\pcl-check.json"
```

```bash
"/Applications/Personal Color Lab.app/Contents/MacOS/Personal Color Lab" \
  --self-test --self-test-report /tmp/pcl-check.json
```

## 다시 빌드하기

빌드 단계만 네트워크를 사용합니다. CPython 3.13.16은 Astral 공식 python-build-standalone `20261003` 릴리스에서 고정 SHA-256을 확인하여 받습니다. 전체 런타임 배포물의 네이티브 라이브러리 라이선스를 포함합니다. 분석 라이브러리는 `requirements.lock`과 PyPI SHA-256을 확인합니다. build 도구와 pip/ensurepip는 앱에 포함하지 않습니다.

```bash
python -m pip install -r requirements-build.lock
python tools/download_runtimes.py
python tools/download_wheels.py
python tools/build_installers.py --target windows-x64
python tools/build_installers.py --target macos-arm64
python tools/build_installers.py --target macos-x64
```

Windows 빌드는 NSIS 3.11 이상의 `makensis`가 필요합니다. macOS에서는 Apple `pkgbuild`·`productbuild`를 사용합니다. Linux에서 `.pkg`를 생성하려면 [bomutils](https://github.com/hogliux/bomutils)의 `mkbom`과 POSIX `cksum`이 필요하며 `--mkbom /path/to/mkbom`으로 지정합니다. 숨김 `.dylibs`도 BOM에 포함되도록 명시적 파일 목록을 전달합니다. 결과와 체크섬은 `dist/installers`에 생성됩니다. 준비된 리소스가 있으면 `build_installers.py`는 오프라인으로 실행할 수 있습니다.

실제 운영체제에서 빌드·설치·번들 진단·GUI·제거를 확인하는 `.github/workflows/installers.yml`을 포함했습니다. 프로젝트 저장소에 저장한 후 **Build and test desktop installers** 워크플로를 수동 실행하세요. 각 아키텍처에 맞는 러너를 사용하며 테스트 데이터만 사용합니다. 현재 ZIP에서 받은 소스 폴더는 별도 Git 원격 저장소에 연결하지 않았습니다.
