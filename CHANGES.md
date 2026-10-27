# v0.13.0 — 선명한 그림과 이어지는 움직임

고해상도 아트와 최적화본을 통합하고 기존 연출·움직임·출구·전리품 개선을 함께 반영했습니다.

전달해 주신 최적화본에서 고해상도 배경·캐릭터·조연·마도서 그림과 큰 창의 글자 처리, HUD 갱신 절약, 셰이더 준비를 가져왔습니다. 기존 진행 중이던 개선도 함께 합쳤습니다. 원래의 아기자기한 그림과7계열 기본 마법, 장비36종, 원정8구역, 두 상점, 영구 성장은 유지합니다. [통합 범위와 판단 근거](CLAUDE-INTEGRATION-v0.13.0.md)를 따로 남깁니다.

주머니 불꽃을 포함한 Q 특수기12종에 전용 몸짓과 발밑 시전 표시, 서로 다른 효과를 더했습니다. 주머니 불꽃은 별 모양 불꽃이 펼쳐지고, 특수기 이름이 HUD에 강조됩니다. 기본 마법의 실수 연출이 덮어쓰지 않도록 분리하며, 기존 피해와 대기 시간 규칙을 유지합니다.

같은 장소에서 대사가 바뀌어도 배우와 카메라가 처음부터 다시 등장하지 않습니다. 동작 시간을 이어 가고 표정과 배치만 부드럽게 전환합니다. 일시정지·설정 중에는 이야기 동작도 멈춥니다. 기본 이동과 투사체에는 렌더링 보간을 적용하고, 시전 자세는 짧게 이어 붙입니다.

전투 중에는 출구가 보이지 않습니다. 마지막 적을 처치하면 출구가 나타나며 상점은 바로 통과할 수 있습니다. 마지막 보스 뒤에는 불필요한 출구를 만들지 않습니다. 기본 끌어오기 반경은64→128, 실제 줍기 반경은30→52로 늘렸습니다. 가방이 가득 찬 장비와 체력이 가득 찬 회복 간식은 소비하지 않습니다.

화면과 글자는 창 해상도에 맞춰 그리며, 정적 배경도 큰 창에 맞춰 준비합니다. 실제3840×2160 창에서 그림과 UI를 확인했습니다. 원래16:10 구도를 유지하는 게임 내용은3456×2160으로 표시됩니다. F10 설정에서 한국어·영어, 창 모드·전체 화면, 프레임 제한을 바꾸고 다음 실행에도 유지합니다. 프레임 제한을 바꾸는 옵션은 사용자 선택이며, 실제 성능이 해당 프레임을 보장한다는 뜻은 아닙니다.

1280×800 클라우드 소프트웨어 렌더링에서 공개 v0.12.0과 각2회 비교한 p95 프레임 시간 평균은 전투82.73→69.70ms, 상점67.31→60.75ms, 이야기78.52→51.68ms였습니다. 이야기 화면 뒤의 보이지 않는 월드와 HUD를 계속 그리던 회귀도 찾아 고쳤습니다. 실제 Windows GPU 성능이나4K60fps를 보장하는 수치는 아닙니다.

## 검증

소스1,747개 / 34suite, Windows/Wine와 Linux 실행 각각25개, Web 조작·이야기·한영 전환·저장·특수기48개 검사를 통과했습니다. Mac은 앱 구조·arm64·권한·리소스/코드 서명 해시를 확인했습니다. 실제 Windows GPU 성능과 Mac 실기 실행은 확인하지 않았습니다. [QA 기록](QA-v0.13.0.md)에 실제 로그와 범위를 남깁니다.

## 다운로드

ZIP을 새 폴더에 압축 해제하고 실행 파일 또는 Mac 앱을 여세요.

- [Windows](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.13.0/Meowgnificent-v0.13.0-windows.zip)
- [Mac / Apple Silicon](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.13.0/Meowgnificent-v0.13.0-macos.zip)
- [Linux](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.13.0/Meowgnificent-v0.13.0-linux.zip)
- [Web 배포용](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.13.0/Meowgnificent-v0.13.0-web.zip)
- [소스](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.13.0/Meowgnificent-v0.13.0-source.zip)
