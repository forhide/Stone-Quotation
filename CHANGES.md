# v0.6.0 — Meowmalade’s Misadventure

고양이의 어설픈 마법이 엉뚱한 사고를 만드는 모험을, 밝은 정원과 둥근 SD 캐릭터·파스텔 카툰 음영의 고해상도 2D 그림책 스타일로 정리합니다. 픽셀 격자와 거친 금속·석조 재질을 드러내는 표현은 사용하지 않습니다.

## Meowmalade와 The Perfect Grimoire

Arcana Academy 실기 시험에서 작은 화염구 하나를 맞히려던 Meowmalade가 사고를 냅니다. 그 틈에 모든 마법의 오류를 없애려는 The Perfect Grimoire가 깨어나고, 고양이는 Detention에서 The Grand Archive까지 원정을 이어갑니다.

한국어 대사로 구성한 오프닝, 구역별 대화와 마지막 성적표 결말을 게임 안에 표시합니다. 한글·라틴 문자용 번들 글꼴과 라이선스를 포함합니다. 이야기 화면은 `Enter`·`Space`로 다음 페이지를 보고 `Esc`로 건너뜁니다. 대화가 열리는 동안 전투는 멈추며, 끝나면 원정 조작으로 돌아옵니다. 이야기 속 얼음·순간이동·소환과 등장인물의 연출은 새로 사용할 수 있는 전투 주문이나 동료 전투 AI를 뜻하지 않습니다. 실제 전투의 사용 주문은 화염구입니다.

마지막 **The Perfect Wizard**는 전용 보스입니다. 장벽이 닫혔을 때 일반 성공 주문을 예측하고, 실수·폭주·몸통 구르기·책장 등 환경 사고를 맞으면 4초 동안 빈틈을 드러냅니다. 예고한 광선 공격이 끝난 뒤에도 1.6초의 공략 기회가 생기므로 무작위 실수만 기다릴 필요가 없습니다.

## 화면의 변화

- 주황색 고양이는 둥근 중간 체형과 반쯤 감긴 심드렁한 눈을 살린 부드러운 SD 그림으로 바뀝니다. 손에 든 지팡이 없이 앞발로 시전하며 대기·준비·발사·당황·피격·구르기를 구분합니다.
- 촛불 젤리·장난감 빗자루·인형 같은 박쥐는 둥근 몸체와 따뜻한 윤곽선, 민트·라벤더·살구색 음영을 사용합니다.
- 구역마다 밝은 정원·돌길·나무 데크, 책·꽃·버섯과 작은 소품을 배치합니다. 입장 안내·클리어 안내와 8칸 진행 표시는 이어갑니다.
- 마법에는 별·팝 스파크·솜 같은 연기의 카툰 효과를 사용합니다. 실수의 `WHOOPS!`와 X 표식, 적의 공격 예고·바닥 위험 범위를 구분합니다.
- HUD·구역 안내·장비·상점·영구 강화 패널은 크림색 카드, 코코아색 글자와 파스텔 강조색으로 맞춥니다.

정적인 배경은 입장 때 한 번 캐시에 그리고, 캐릭터·적·효과는 공유 텍스처와 선형 필터를 사용합니다. 내부 렌더링은 1280×800입니다.

## 여덟 구역과 이어지는 성장

| 구역 | 장소 | 역할 |
|---|---|---|
|1|Detention|튜토리얼 전투|
|2|The Library|전투|
|3|The Forbidden Garden|정예가 포함된 전투|
|4|Pip’s Picnic|상점|
|5|The Failed Wizards|전투|
|6|The Ordered Promenade|정예가 포함된 전투|
|7|The Last Loose End|상점|
|8|The Grand Archive|The Perfect Wizard 보스전|

총 8구역은 전투 6곳과 상점 2곳입니다. 모든 적을 물리치면 `Enter` 또는 열린 출구 근처 `E`로 다음 구역에 갑니다. 적 전리품과 Crowns·장비 3슬롯/9종, Starlight 영구 강화 4종을 이어갑니다. Crowns와 찾은 장비는 원정마다 초기화되고, Starlight·구매한 강화와 시도·완주 기록은 다음 도전에도 남습니다. 저장 형식은 기존 `progress-v1.json`을 사용합니다.

## 플랫폼과 다운로드

Windows·Linux 실행 파일, macOS 앱, Web 배포 파일과 소스를 ZIP으로 제공합니다. 사용자 소유 `forhide/Stone-Quotation` 저장소의 전용 `meowgnificent-downloads-v0.6.0` 브랜치를 사용합니다. ZIP을 새 폴더에 압축 해제해 실행하며 설치 프로그램이나 터미널 다운로드 명령은 필요하지 않습니다.

아래 GitHub 전용 브랜치에서 ZIP을 제공합니다. 패키지 무결성과 실제 게시 URL의 새 다운로드 검증은 배포 단계에서 별도로 수행합니다.

- [Windows ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.6.0/Meowgnificent-v0.6.0-windows.zip)
- [macOS ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.6.0/Meowgnificent-v0.6.0-macos.zip)
- [Linux ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.6.0/Meowgnificent-v0.6.0-linux.zip)
- [Web ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.6.0/Meowgnificent-v0.6.0-web.zip)
- [소스 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.6.0/Meowgnificent-v0.6.0-source.zip)
- [SHA-256 목록](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.6.0/Meowgnificent-v0.6.0-SHA256SUMS.txt)

Mac은 macOS 11 이상 Apple Silicon 기준이며 공식 Universal 템플릿을 사용합니다. 임시(ad-hoc) 서명 앱으로 실제 Mac 실행과 Apple 공증은 미실시입니다. Wine을 이용한 Windows 실행 검증은 실제 Windows PC 하드웨어·드라이버 검증과 구분합니다.

## 검증 결과

| 검사 | 결과 |
|---|---:|
| 소스 기능·보스·실제 주문 충돌·이야기 |451/451|
| Windows 실행 파일 / Wine |23/23|
| Linux 실행 파일 |23/23|
| Chromium Web 일반 진행·저장 복원 |15/15|
| Chromium Web 기본 이야기 입력·건너뛰기 |10/10|
| Mac ZIP·권한·arm64·서명 데이터 |통과|

소스 451개는 기존 기능 341개, 보스 규칙 27개, 실제 최종방과 주문 충돌 통합 25개, 이야기 흐름 58개를 합한 수치입니다. 실행 파일은 튜토리얼 전투·2구역 도착·전리품 장착·패배와 새 프로세스의 영구 진행 복원을 확인했습니다. 전체 8구역과 최종 보스·결말은 소스 통합검사 범위입니다.

일반 전투 회귀 검사는 이야기를 건너뛰는 테스트 플래그를 사용하고, 별도 Web 이야기 검사는 그 플래그 없이 오프닝의 첫 페이지·다음 페이지·Esc로 Detention 진입·장비와 정지 조작을 실제 입력으로 확인했습니다. 브라우저에서 오프닝 전체 자동 재생이나 전체 원정·결말을 플레이한 검사는 아닙니다. [상세 QA와 원자료](QA-v0.6.0.md)에 범위를 기록했습니다.

성능 비교에서 평균 그리기 호출은 튜토리얼 72.86→76.36회, 최종방 효과 중첩 134.43→139.24회였습니다. 평균 프레임 시간은 각각 24.15→28.19ms, 30.94→26.91ms로 한 장면은 느려지고 다른 장면은 빨라졌습니다. 공유 클라우드 소프트웨어 렌더러에서 장면별 각 한 번 측정한 혼재된 결과이며 전반적인 성능 향상이나 실제 Windows PC의 FPS를 보장하지 않습니다. [측정 방법과 결과](qa/v060-performance/METHOD.md)를 참고하세요.

Mac은 앱 메타데이터·실행 권한·arm64·PCK·리소스 해시 9개와 서명 코드 페이지 89,490개를 확인했습니다. 실제 Mac 실행·Apple 공증과 네이티브 Windows 하드웨어 검증은 미실시입니다. 소스 ZIP에는 현재 버전의 `docs/qa/` 증거를 포함하며 이전 버전의 증거는 해당 버전 소스 ZIP에 있습니다.
