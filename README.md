# Personal Color Lab 0.5.2 다운로드

**RAW + JPG / RAW + XMP / 완성 JPG**에서 배운 스타일을 새 JPG/RAW에 적용합니다. 로컬 모델로 80종 객체·사람 영역·얼굴을 인식하고, 지원하는 객체별 색감을 학습·적용합니다. **사진 처리는 전부 오프라인이며 API 호출·토큰 비용·첫 실행 모델 다운로드가 없습니다.** V0.5.2는 반복 처리 알고리즘을 개선하고 사진 중심의 작업실, 오른쪽 조절 패널, 사진으로 보는 추천 스타일, 직접 드래그하는 전후 비교, 펼쳐 보는 설정과 명확한 자료 분석 단계를 추가했습니다. [PERFORMANCE.md](PERFORMANCE.md)에서 측정 조건과 결과를 볼 수 있습니다. 전후 미리보기·강도 조절·스타일 혼합·기본 스타일 12개·JPG/XMP/JSON 내보내기를 제공합니다. 반복 분석 캐시와 디코딩 전 중복 제외, 비슷한 사진 검토 표시, 저장 결과 이름 변경/삭제도 포함합니다.

## 자료별 분석

| 자료 | 추출하는 내용 | 해석 범위 |
| --- | --- | --- |
| RAW + JPG | RAW를 고정된 현상 설정으로 변환한 기준 이미지와 완성 JPG의 밝기·대비·톤 곡선·색 변화 | 현상 기준에 대한 추정입니다. Lightroom의 실제 슬라이더 값을 복원했다고 보지 않습니다. |
| RAW + XMP | XMP에 기록된 지원 대상의 전역 보정 수치와 톤 곡선 | 기록된 지원 항목을 읽습니다. 모든 Adobe 기능을 해석하거나 Lightroom과 같은 렌더링 결과를 재현하지는 않습니다. |
| 완성 JPG | 밝기·대비·채도·주요 색상·명암 영역의 색감과 여러 사진의 공통 경향 | 최종 사진의 시각적 특징입니다. 촬영 조명과 보정 효과를 분리하거나 원래 보정 이력을 복원하지는 않습니다. |

## 사용 순서

1. **Choose folder / 폴더 선택**에서 자료가 들어 있는 폴더를 선택합니다.
2. **RAW + JPG**, **RAW + XMP**, **JPG references / JPG 참고 사진** 중 자료에 맞는 방식을 선택합니다.
3. 목록을 확인하고 불필요한 사진을 제외합니다. 짝이 모호하거나 없는 항목은 대응 파일을 직접 선택합니다.
4. **Analyze selected files / 선택한 파일 분석**을 누릅니다. 개별 실패와 중복, 제외된 항목은 결과에서 확인할 수 있습니다.
5. 결과를 확인한 뒤 이름을 입력하고 **Save style / 스타일 저장**을 누릅니다.
6. 앱을 다시 실행해도 **Saved styles / 저장된 스타일**에서 저장한 분석 결과를 열 수 있습니다. 다시 여는 결과는 저장 당시의 스냅샷입니다.

7. 분석 결과의 **Apply style / 스타일 적용**을 누르거나 사이드바에서 스타일 적용 작업실을 엽니다.
8. 새 JPG/RAW를 선택하고 적용 강도를 조절합니다. 다른 스타일을 선택하면 두 스타일의 혼합 비율도 조절할 수 있습니다.
9. 전후 화면을 확인하고 **JPG 사본 내보내기**, **XMP 프리셋 내보내기** 또는 **스타일 파일 내보내기**를 선택합니다. 저장된 스타일과 JSON은 재사용할 수 있습니다.

흑백 사진 쌍의 예전 저장 분석은 다시 분석하면 새 흑백 증거를 반영합니다. 혼합 색상·세피아 참고 사진은 흑백으로 단정하지 않습니다.

원본과 기존 출력 파일을 덮어쓰지 않습니다. XMP는 Lightroom에서 가져오는 전역 설정의 근사 프리셋이며 Adobe와 동일한 렌더링은 아닙니다. 기본 구도 설정은 색감만 적용이며, 안내선이나 사본 자르기는 사용자가 선택해야 적용됩니다. 참고 JPG의 조명·피사체와 보정 효과는 완전히 분리할 수 없습니다. 저/중/고 밝기 그룹에 더해 사람·동물·음식·차량 등 검출 객체의 맥락을 사용합니다. 사람은 분할 마스크, 얼굴은 보호 타원, 나머지 객체는 박스 근사입니다. 하늘·지형의 전체 분할은 아직 지원하지 않습니다. 스타일 추천은 시각 통계 비교이며 작가나 영화의 정체성을 판별하는 분류기가 아닙니다.

## 설치 파일

| 대상 | 최소 운영체제 | 다운로드 |
| --- | --- | --- |
| Windows Intel/AMD 64비트 | Windows 10/11 | [Windows ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.2/PersonalColorLab-0.5.2-windows-x64-download.zip) |
| Mac Apple Silicon | macOS 13 | [Apple Silicon ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.2/PersonalColorLab-0.5.2-macos-arm64-download.zip) |
| Mac Intel | macOS 14 | [Intel Mac ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.2/PersonalColorLab-0.5.2-macos-x64-download.zip) |

ZIP 압축을 풀고 Windows는 `.exe`, Mac은 CPU에 맞는 `.pkg`를 실행하세요. Python을 별도로 설치할 필요가 없습니다. 기존 앱을 종료한 후 설치하면 사진 원본·DB·설정은 유지됩니다. DB는 스키마 3으로 갱신되어 이전 버전 앱에서 열 수 없으므로 낮은 버전으로 돌아가기 전 데이터 폴더를 백업하세요. 기본 언어는 영어이며 앱에서 한국어를 선택할 수 있습니다.

서명되지 않은 개발용 설치 파일이므로 운영체제 확인 경고가 나타날 수 있습니다. 실제 Windows·macOS 기기의 설치, Mac Retina 화면, 서로 다른 배율의 모니터 간 이동은 아직 검증하지 않았습니다.

## 앱 화면

실행 중인 Tk 앱에서 직접 캡처했습니다. 분석 예시는 합성 테스트 자료를 사용했습니다.

![객체 인식과 넓은 전후 비교](preview/recognized-person-ko.png)

인물 화면은 NASA 공개 도메인 사진으로 실제 앱에서 캡처했습니다. 이미지 출처: [scikit-image astronaut 자료 및 공개 도메인 안내](https://github.com/scikit-image/scikit-image/blob/v0.19.3/skimage/data/_fetchers.py). 인식은 사람/얼굴 위치만 다루며 신원을 식별하지 않습니다.

![스타일 적용 작업실](preview/style-studio-ko.png)

![사진 작업실](preview/library-ko.png)

![자료 방식 선택과 파일 확인](preview/review-ko.png)

![완성 JPG 색감 경향](preview/reference-result-ko.png)

![RAW와 JPG 보정 변화](preview/raw-jpg-result-ko.png)

![RAW와 XMP에 기록된 보정치](preview/raw-xmp-result-ko.png)

## 검증과 소스

최종 Linux 소스·GUI·아카이브 테스트 **598개가 통과**했습니다. 실패·오류·건너뛴 테스트가 없는 최종 JUnit 보고서에서 이 수치를 읽습니다. Windows는 Wine에서 설치·실행·제거를 검증하고, macOS 두 패키지는 파일 해시·권한·링크·BOM을 검증했습니다. 실제 검증 범위와 알려진 한계는 [VALIDATION.md](VALIDATION.md)에 명시했습니다.

- [설치·업데이트·제거 안내](INSTALLERS.md)
- [소스 및 빌드 도구 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/personal-color-lab-downloads-v0.5.2/PersonalColorLab-0.5.2-source.zip)
- [ZIP SHA-256 체크섬](SHA256SUMS.txt)
- [자동 테스트 결과](source-tests.xml)

사진 원본을 수정하거나 업로드하지 않습니다. 이 브랜치는 다운로드와 검증 자료 전달용입니다. 저장소 main은 유지됩니다.
