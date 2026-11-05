# v0.18.0 — 재질, 글씨, 한눈에 보는 배움

지팡이 특수기8계열을627픽셀 단위의 새 고밀도 원본으로 바꿨습니다. 원본을 단순 확대하는 대신 접지 그림자와 재질의 솟아오름·착지·소멸을 나누고, 돌5개·얼음2무리·덩굴과 금속의 각 조각이 시간차로 올라오게 했습니다. 물결은 이동 방향에 맞춰 뒤집히며 메테오는 낙하와 충돌을 구분합니다. 효과의 저농도 잔광이 갑자기 사라지지 않도록 원본 알파와 시전 투명도를 분리했습니다. 실제 타격·속성·재사용 시간은 유지합니다.

목걸이를 끼우면 원본 방울 영역에만 깨끗한 털을 합성하고 새 펜던트를 목 위치에 붙입니다. 원본 얼굴·몸·모자와 목줄 양옆은 유지합니다. 행동5포즈·걷기6프레임과 장비창을 함께 처리하며 장비를 빼면 원래 방울이 돌아옵니다.

나무 판넬 위의 평면 글씨는 양피지 인터페이스 캡션으로 바꿨습니다. 게이트·상점·다음 전투 안내가 같은 형태를 사용합니다. 제목/버튼은 둥근 주아체, 본문/대사는 고운돋움으로 통일하고 두 글꼴의SIL OFL 라이선스를 동봉했습니다.

공격 예고는 색이 차오르는 장미빛 워시와 크림색 테두리, 손그림 빛 리본과 준비 시계입니다. 단일 셰이더 사각형을 유지하면서 실제 경로·끝점·폭 안에만 장식을 표시합니다. 가구 앞에서 멈추는 경로, 준비·실행·취소와 일시정지를 유지합니다.

책장·넘어진 책장·수레·재배 화분·상자·통·샛길·보관함을3/4 재질 아트로 교체했습니다. 전체 책장은11→25개이며27개 소품과 두 상점 테이블도 바닥 충돌을 가집니다. 정원의 통로는 도서관 가구 대신 화분을 사용합니다. 입구·출구·각 전투 지점에 닿는 길, 전리품 위치와 적의 안전한 등장 간격을 검사합니다. 추가 장애물 때문에 지역 후보를 찾지 못하면 전투를 예고할 때만 남은 바닥을 찾아 배치합니다. 오른쪽/아래 경계 바로 위에 놓이던 끝점도 안쪽으로 보정했습니다.

영구 연구16종·125단계는 탭 없이 한 화면에 표시합니다. 네 열은 준비·마법·발끝·휴식의 보기용 제목이며16개 카드가 모두 보입니다. 아이콘·짧은 효과·단계 점·비용·구매를 함께 표시하고, 자세한 설명은 도움말에 둡니다. 첫 열 외의 연구도 바로 구매하며 구매 후 키보드 초점은 해당 연구로 돌아옵니다. 저장 형식2와 기존 별빛·구매·기록은 유지합니다. 도전·완주 기록은 보드 위 한 줄에 표시합니다. 장비창에서 초점 전환 중 장착 버튼을 다시 만들어 첫 클릭을 놓치던 문제도 수정했습니다.

Windows·Apple Silicon Mac·Linux·Web·전체 소스와 같은 버전 코드/그래픽 인계 ZIP을 제공합니다. 분리 ZIP은 각각20MiB 미만이며 큰 아트 그룹은 독립 ZIP으로 나눕니다. 검사 범위와 실제 결과는 QA-v0.18.0.md를 따릅니다. Windows는 Wine이며 Mac 실기 실행과 Apple 공증은 미확인입니다.


## Direct downloads

- [Meowgnificent-v0.18.0-windows.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.18.0/Meowgnificent-v0.18.0-windows.zip)
- [Meowgnificent-v0.18.0-linux.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.18.0/Meowgnificent-v0.18.0-linux.zip)
- [Meowgnificent-v0.18.0-web.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.18.0/Meowgnificent-v0.18.0-web.zip)
- [Meowgnificent-v0.18.0-macos.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.18.0/Meowgnificent-v0.18.0-macos.zip)
- [Meowgnificent-v0.18.0-source.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.18.0/Meowgnificent-v0.18.0-source.zip)
- [Meowgnificent-v0.18.0-SHA256SUMS.txt](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.18.0/Meowgnificent-v0.18.0-SHA256SUMS.txt)

Download the ZIP, extract it, and launch the executable or app. No MSI installer or CMD download command is needed.

[같은 버전 코드·그래픽 인계 세트 — ZIP마다20MiB 미만](https://github.com/forhide/Stone-Quotation/tree/meowgnificent-handoff-v0.18.0)
