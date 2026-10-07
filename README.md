# Personal Color Lab 0.2.0 설치 파일

아래 운영체제에 맞는 **다운로드** 링크를 클릭하세요. GitHub 로그인 화면이 나오면 이 저장소에 접근할 수 있는 계정으로 로그인하세요.

| 운영체제 | 최소 버전 | 다운로드 | ZIP 크기 |
| --- | --- | --- | --- |
| Windows Intel/AMD 64비트 | Windows 10/11 | [Windows 설치 파일](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.2.0/PersonalColorLab-0.2.0-windows-x64-download.zip) | 47.9 MiB |
| macOS Apple Silicon (M1/M2/M3/M4 등) | macOS 13 | [Apple Silicon 설치 파일](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.2.0/PersonalColorLab-0.2.0-macos-arm64-download.zip) | 80.5 MiB |
| macOS Intel | macOS 14 | [Intel Mac 설치 파일](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.2.0/PersonalColorLab-0.2.0-macos-x64-download.zip) | 62.6 MiB |

ZIP 압축을 풀고 Windows는 `.exe`, macOS는 CPU에 맞는 `.pkg`를 실행하세요. Python을 별도로 설치할 필요가 없습니다. 설치 후 앱은 오프라인으로 동작합니다. 앱의 기본 언어는 영어이며 한국어를 선택할 수 있습니다.

현재 버전은 **개발용 빌드**입니다. 코드 서명과 Apple 공증을 하지 않았으므로 운영체제 확인 경고가 나타날 수 있습니다. Windows·macOS 실제 기기의 설치 및 GUI 검증은 아직 완료하지 않았습니다. Linux 테스트 144개, Windows Wine 설치·GUI·제거 검사, macOS 두 패키지의 구조·해시·권한 검사 결과와 범위는 [VALIDATION.md](VALIDATION.md)를 참고하세요.

자세한 설치·업데이트·제거 방법은 [INSTALLERS.md](INSTALLERS.md)에 있습니다. Windows ARM 에뮬레이션은 검증하지 않았습니다.

## 파일 무결성 확인

ZIP의 SHA-256은 [SHA256SUMS.txt](SHA256SUMS.txt)와 각 파일의 `.zip.sha256`에 있습니다. ZIP 안에는 설치 파일 자체의 `.sha256`도 포함됩니다.

Windows PowerShell:

```powershell
Get-FileHash .\PersonalColorLab-0.2.0-windows-x64-download.zip -Algorithm SHA256
```

macOS:

```bash
shasum -a 256 PersonalColorLab-0.2.0-macos-arm64-download.zip
```

이 브랜치는 설치 파일 배포용입니다. 개발 소스와 빌드 도구는 현재 작업 환경의 Personal Color Lab 프로젝트에 보관되어 있습니다.
