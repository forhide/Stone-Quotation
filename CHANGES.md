# v0.5.0 — Distinct Destinations

같은 배경에서 구역 번호만 바뀌어 이동 여부가 잘 보이지 않던 문제를 개선하는 그래픽 업데이트입니다. 구역 입장 안내와 진행 표시를 추가하고, 장소별 배경 및 적·주문 효과의 세부 표현을 강화합니다.

## 구역 수와 전환

원정은 **전투 6곳과 상점 2곳을 합쳐 총 8구역**입니다. 첫 전투는 튜토리얼이고 마지막 전투는 정예전입니다. 장비 9종은 구역 수와 관계없습니다. 이번 업데이트에서 구역을 9개로 늘리지 않았습니다.

| 순서 | 장소 | 구성 |
| --- | --- | --- |
| 1 | The Candlewick Archives | 따뜻한 촛불 도서관, 튜토리얼 |
| 2 | Stacks of Loose Ends | 차가운 서고, 전투 |
| 3 | The Sootbound Gallery | 그을린 전시관, 정예 포함 전투 |
| 4 | The Kettle & Quill | 아늑한 찻집 상점 |
| 5 | Restricted Reading Room | 보랏빛 봉인 열람실, 전투 |
| 6 | Bellkeeper's Passage | 청록빛 종지기 통로, 정예 포함 전투 |
| 7 | Paper Moon Caravan | 달빛 행상 상점 |
| 8 | The Final Examination | 황금 의식실, 마지막 정예전 |

입장 안내에는 현재 번호·총 구역 수, 장소 이름과 구역 역할을 표시합니다. 진행 표시에서 현재 위치와 상점 위치를 확인할 수 있고 적을 모두 쓰러뜨리면 열린 통로 안내가 나타납니다. 다음 구역으로 이동하는 조작은 `Enter` 또는 열린 출구 근처 `E`입니다.

## 그래픽과 프레임 부하

- 장소마다 바닥 문양과 건축 장식, 조명 분위기를 달리합니다. 정적인 배경은 입장할 때 캐시에 그려 매 프레임 세부 장식을 다시 만들지 않습니다.
- 촛불 슬라임·갑옷 빗자루·박쥐의 몸체와 재질 표현을 개선합니다. 공격 예고 방향과 피격 판정은 기존 전투 규칙을 따릅니다.
- 성공 주문, 실수의 연기와 부서진 불꽃, 폭주 주문 및 폭발을 구별해서 표현합니다. 실수의 `WHOOPS!` 표시는 유지합니다.
- 고양이의 중간 체형과 대기·준비·발사·놀람·피격·구르기 포즈는 이어갑니다. 새 배경 장식이 추가 충돌 장애물을 뜻하지는 않습니다.

같은 클라우드 환경에서 효과 중첩 장면의 평균 그리기 호출은 149.54→134.92회, 평균 프레임 시간은 33.90→24.13ms로 측정됐습니다. 일반 효과 장면은 94.87→73.03회, 22.06→20.97ms였습니다. 장면별 각 한 번 측정한 값이며, 조건과 원자료는 [성능 기록](qa/v050-performance/METHOD.md)에 있습니다. 공유 클라우드의 소프트웨어 렌더러 측정은 실제 사용자 Windows PC의 프레임 속도를 보장하지 않습니다.

## 이어지는 게임 규칙

적 처치 전리품, Crowns 구매와 장비 3슬롯·9종, 상점 두 곳, Starlight 영구 강화 4종은 v0.4.0의 규칙을 유지합니다. Crowns·장비·현재 원정은 새 도전에 초기화되고 Starlight·구매한 영구 강화·시도 및 완주 기록은 저장됩니다. 기존 `progress-v1.json` 프로필 형식을 사용합니다.

마지막 정예는 기존 빗자루 AI를 사용하는 강화 적입니다. 별도 보스 AI, 절차 생성 맵, 추가 주문, Chonk 성장이나 진행 중 원정 이어 하기를 추가한 버전은 아닙니다.

## 플랫폼과 배포

Windows·Linux 실행 파일, Web 배포 파일과 macOS 앱을 ZIP으로 제공합니다. 설치 프로그램이나 터미널 다운로드 명령 없이 압축을 풀어 실행합니다. 배포는 사용자 소유 `forhide/Stone-Quotation` 저장소의 전용 `meowgnificent-downloads-v0.5.0` 브랜치를 사용합니다.

- [Windows ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.5.0/Meowgnificent-v0.5.0-windows.zip)
- [macOS ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.5.0/Meowgnificent-v0.5.0-macos.zip)
- [Linux ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.5.0/Meowgnificent-v0.5.0-linux.zip)
- [Web ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.5.0/Meowgnificent-v0.5.0-web.zip)
- [소스 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.5.0/Meowgnificent-v0.5.0-source.zip)
- [SHA-256 목록](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.5.0/Meowgnificent-v0.5.0-SHA256SUMS.txt)

Mac은 macOS 11 이상 Apple Silicon 기준이며 공식 Universal 템플릿을 사용합니다. 임시(ad-hoc) 서명 앱으로 실제 Mac 실행과 Apple 공증은 미실시입니다. Windows의 Wine 실행 검증은 실제 Windows 하드웨어 검증과 구분합니다.

## 이번 빌드 검증 상태

Godot 4.6.3 소스 자동검사 **341개**, Windows/Wine 실행 파일 **23개**, Linux 실행 파일 **23개**, Chromium Web **15개** 검사를 통과했습니다. Mac은 ZIP·앱 메타데이터·실행 권한·arm64·리소스 해시 9개·서명 코드 페이지 89,490개를 확인했습니다.

실행 파일 검사는 튜토리얼 전투, 2구역 도착 안내, 전리품 장착, 패배와 새 프로세스에서 영구 진행 복원을 다룹니다. 전체 8구역 원정과 두 상점은 소스 통합검사 범위입니다. Web은 실제 캔버스 조작과 페이지 재시작 뒤 저장 복원을 확인했습니다. 상세 범위와 로그는 [v0.5.0 QA](QA-v0.5.0.md)에 있습니다.

검증한 실행 파일과 ZIP 내부 실행 파일의 SHA-256을 비교하며, 배포 ZIP과 체크섬 목록은 같은 버전의 전용 브랜치에 제공합니다. 실제 Windows PC 프레임과 Mac 실행·공증은 확인하지 못했습니다.
