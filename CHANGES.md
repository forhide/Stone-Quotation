# v0.12.0 — 마법 도구와 살아 움직이는 학교

기본 공격이 모든 무기에서 화염구로 고정되던 문제를 고칩니다. 주무기12종을 일곱 기본 마법 계열과 연결하고, 실제 발사체·부가 효과·충격과 장비 그림을 함께 맞춥니다. Q 특수기는 별도로 유지하며 장비를 바꿔도 남은 특수기 대기 시간을 초기화하지 않습니다.

| 기본 마법 | 성격 |
| --- | --- |
| 불 | 둥근 화염구, 책장 점화 |
| 물 | 가까운 다른 적에게 물방울 튐 |
| 얼음 | 맞은 적을 잠깐 느리게 함 |
| 바람 | 두 적까지 연속 통과 |
| 돌 | 느리지만 묵직한 밀어내기 |
| 잎 | 가까운 앞쪽 적을 향해 완만하게 휨 |
| 번개 | 빠른 작은 번개 |

이야기는 원래 개발노트의 과녁 시험→역발사→뒤편 폭발, 지하 창고 벌청소, 통제된 도서관·정원, 낙제생 친구들, 완벽의 마도서라는 흐름을 유지합니다. 과녁과 배우·카메라·불꽃·종이·연기를 실제로 움직이고, 첫 구역 다음에는 회상임을 표시한3장면을 더해53장면으로 구성합니다. 각 구역의 실제 책/버섯 적과 관리 통로를 설명하도록 일부 한·영 대사를 다듬었습니다.

완벽의 마도서는 책 자체가 캐릭터입니다. 평상시·분노·당황·손상 표정과 펼쳐지는 책장으로 반응하며, 최종전에서는 기록한 주문을 갑옷처럼 펼친 전투 형태를 사용합니다. 기존 방어막·실수의 빈틈·보스 체력 규칙을 이어갑니다.

책은 간격을 맞춘 열에서 출발해 예고한 방향으로 덮칩니다. 물약 재료용 버섯은 마도서에 조종되어 재배장에서 일어나며, 원형 예고 뒤 포자를 내뿜습니다. 정원/상점의 뜬금없는 책장은 없애고, 도서관의 특정 책장 뒤에는 한 번 조사할 수 있는 크라운12개와 회복 간식20이 있는 관리 통로를 배치합니다. 이 보급품은 선택 사항이며 전투 클리어를 대신하지 않습니다.

상점 친구에게 다가가 E로 이야기하고, 핍은 T로 대화합니다. 핍·중앙 매대의 E 장비 보기는 그대로입니다. 장소마다 다른 대사18개와 잎·덩굴·거품·코르크·깃털 반응을 더하고, 대화는 재화·체력·장비·대기 시간을 바꾸지 않습니다. 일시정지하면 NPC 연출과 대화 시간도 멈춥니다.

## 검증

소스1,461개/27suite, Windows/Wine·Linux 각각25개, 웹48개 검사를 통과했습니다. 실제 범위·로그·실행 제한은 [QA 기록](QA-v0.12.0.md)에 정리합니다. Mac은 패키지·arm64·권한·서명 해시 검사 대상이며 실기 실행은 확인하지 않았습니다.

## 다운로드

ZIP을 새 폴더에 압축 해제하고 실행 파일 또는 Mac 앱을 여세요.

- [Windows](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.12.0/Meowgnificent-v0.12.0-windows.zip)
- [Apple Silicon Mac](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.12.0/Meowgnificent-v0.12.0-macos.zip)
- [Linux](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.12.0/Meowgnificent-v0.12.0-linux.zip)
- [Web 배포본](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.12.0/Meowgnificent-v0.12.0-web.zip)
- [Godot 소스](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.12.0/Meowgnificent-v0.12.0-source.zip)

[SHA-256 목록](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.12.0/Meowgnificent-v0.12.0-SHA256SUMS.txt). 공개 후 ZIP을 새로 다운로드하여 크기·체크섬·압축 무결성을 확인합니다.
