# Personal Color Lab 0.3.1 — Mac 설치 수정판

보안 경고를 넘긴 뒤 설치에 필요한 데이터를 찾지 못하는 문제에 대응합니다. 패키지 내부 설치 파일 참조를 수정했고, 실제 설치 데이터 연결·식별자·버전·필수 파일 검증을 추가했습니다. 기존 0.3.0 파일은 새 참조 검사에서 실패하며, 수정판은 이 검사와 전체 테스트 411개를 통과했습니다.

- [M1·M2 등 Apple Silicon 다운로드 — macOS 13 이상](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.3.1/PersonalColorLab-0.3.1-macos-arm64-download.zip)
- [Intel Mac 다운로드 — macOS 14 이상](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.3.1/PersonalColorLab-0.3.1-macos-x64-download.zip)
- [기존 Windows 0.3.0 다운로드](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.3.0/PersonalColorLab-0.3.0-windows-x64-download.zip)

새 ZIP을 풀고 CPU에 맞는 `PersonalColorLab-0.3.1-….pkg`를 실행하세요. 이전 0.3.0 파일 대신 새 파일을 사용합니다. M1은 Apple Silicon 파일입니다. 사용자 DB·설정과 원본 사진은 보존합니다. 분석 알고리즘은 0.3.0으로 유지해 저장한 분석과 호환됩니다.

이 수정은 설치 데이터 경로 문제에 대한 것입니다. 미서명 개발용이므로 Apple 확인 경고는 계속 나타날 수 있습니다. 차단 후 시스템 설정 → 개인정보 보호 및 보안 → 해당 파일의 확인 없이 열기로 진행하세요. 실제 Apple Installer에서 설치 완료를 확인하지는 못했습니다. 서명·공증도 아직 적용하지 않았습니다.

[설치 안내](INSTALLERS.md) · [검증과 한계](VALIDATION.md) · [체크섬](SHA256SUMS.txt) · [소스 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.3.1/PersonalColorLab-0.3.1-source.zip)
