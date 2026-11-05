# v0.16.0 — 더 넓은 원정과 여덟 속성의 마법

실행·패키지 검증을 마친 v0.16.0입니다. 아래는 공식 GitHub ZIP 직링크입니다.

이야기의 8구역은 유지하면서 전투를 **17차례, 총 106마리**로 늘렸습니다. 벌 청소는 두 차례, 도서관·정원·아지트·산책로·대서고는 세 차례 싸우며, 두 상점에서 쉬어 갑니다. 한 무리를 정리한 뒤 다음 마법진을 찾아가면 도착 표시 후 새 적이 나타납니다. 구역의 모든 전투를 끝내야 출구와 별빛 보상이 열립니다. 대서고에서는 두 방어대를 넘은 뒤 마지막 마도서와 맞섭니다.

월드의 가로·세로를 각각 1.6배로 넓혀 이동 가능한 면적을 **2.56배**로 만들고, 고양이와 적의 그림 크기는 이전의 **80%**로 줄였습니다. 따라가는 카메라와 작은 구역 지도, 현재 전투 표시로 다음 목적지를 알 수 있습니다. 화면 자체를 저해상도로 줄이는 방식이 아닙니다. HD 배경은 확대된 월드와 창 크기에 맞춰 한 번 그려 재사용합니다. 실제 한 판 소요 시간은 플레이 방식에 따라 달라지며, 특정 분량을 보장하지 않습니다.

## 속성과 특수기

불·물·얼음·바람·돌·생명·번개·금속의 **8계열**에 약점과 저항을 연결했습니다. 적의 성격에 따라 같은 공격도 다르게 작용하며, 작은 속성 표시와 피격 반응으로 알려 줍니다. 물에 젖은 적에게 번개를 맞히면 전도 반응이 나고 젖음이 사라집니다. 기존 얼음 둔화·바람 관통·돌 밀치기·덩굴 유도도 이어갑니다.

| 주무기 속성 | 새 대표 특수기 |
| --- | --- |
| 불 | 잠깐의 낙하 예고 뒤 떨어지는 메테오 세 개 |
| 번개 | 주변 적을 차례로 잇는 체인 라이트닝 |
| 물 | 넓게 밀려가는 물결 |
| 얼음 | 퍼져 나가는 눈꽃 폭발 |
| 바람 | 적을 휘감는 회오리 |
| 돌 | 땅을 울리는 돌기둥과 충격 |
| 생명 | 땅에서 자라나는 덩굴 정원 |
| 금속 | 은빛 가시가 피어나는 꽃 |

속성 대표 특수기 8종에 핍의 닭 소환·블룹의 물약 폭탄·찻주전자의 보호 거품을 더해, 장비로 고를 수 있는 특수기는 **11종**입니다. 장착한 주무기 하나가 기본 마법과 Q 특수기 하나를 정하며, 재사용 대기 시간은 장비를 바꾸어도 유지됩니다. 시전 준비·실제 타격·짧게 남는 여운을 나누어 기본 주문의 실수와 구별했습니다. 마지막 적을 쓰러뜨려도 이미 시작한 충격의 그림은 짧게 마무리되고 추가 피해는 멈춥니다.

기본 마법도 속성의 움직임을 살립니다. 불과 물은 일렁이는 둥근 덩어리, 번개는 갈라지는 방전, 금속은 은빛 가시, 생명은 실제 궤적을 따라 감기는 덩굴입니다. 덩굴 뒤쪽 줄기는 시각 효과이며 실제 피해는 선두 접점에서 발생합니다.

## 장비와 표현

장비는 기존 37종에서 **85종**으로 늘었습니다. 주무기 37종·목걸이 24종·부적 24종이며, 새 장비 48종은 각각의 그림을 사용합니다. 초반·중반·후반 드롭과 상점에 나누어 등장하고, 능력 차이는 기존 그림 중심 화살표 비교로 확인합니다. 가방·바닥 전리품·캐릭터가 같은 장비 그림을 공유합니다. 이전 장비와 저장 ID는 유지합니다.

적은 맞으면 눌렸다가 돌아오고, 쓰러진 그림은 짧게 흩어집니다. 전리품을 주우면 고양이 옆에 획득 표시가 뜹니다. 느린 프레임에서도 돌진이 고양이를 건너뛰지 않도록 실제 이동 선분을 따라 충돌을 검사합니다. 짧은 원본 효과음 16개를 더했으며 **설정 → 효과음 → 끔 / 작게 / 보통**에서 음량을 고르고 저장합니다.

기본 마법 HUD의 이름·상태·회복 막대를 고정 영역에 나눴습니다. 핍의 상점에서 **I / 가방 버튼**으로 장비창을 열고 **I / Esc**로 같은 상점에 돌아옵니다. 가방이 가득 차면 장비 구매를 막고 정리 동선을 알려 주며 회복 음식은 사용할 수 있습니다. 바닥에 장비를 남긴 채 출발하려면 경고 후 **5초 안에 Enter / 출구의 E를 다시 눌러** 확인합니다.

이야기에서는 핍의 소환 뒤 실제 그려진 닭이 발을 딛고 쪼며, 마지막 쉼터에 찻주전자와 찻잔이 남습니다. 마도서의 각성은 서고의 책을 보여 주는 장면으로 이어지고 교수도 마지막 지하실 대사가 끝날 때까지 자리를 지킵니다. 원래 시나리오의 53비트를 유지합니다.

## 다운로드

ZIP을 새 폴더에 풀고 실행 파일 또는 Mac 앱을 여세요. 공식 GitHub의 ZIP 직링크이며 별도 CMD 설치 명령은 필요 없습니다.

- [Windows](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-windows.zip)
- [Mac / Apple Silicon](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-macos.zip)
- [Linux](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-linux.zip)
- [Web 배포용](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-web.zip)
- [소스](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-source.zip)

검증 범위는 [QA 기록](QA-v0.16.0.md)에 기록합니다. Windows 실행 검증은 Wine이며 실제 Windows GPU 성능 측정과 다릅니다. Mac은 패키지 검증이며 실제 Mac 실행은 확인하지 못했습니다.


## Direct downloads

- [Meowgnificent-v0.16.0-windows.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-windows.zip)
- [Meowgnificent-v0.16.0-linux.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-linux.zip)
- [Meowgnificent-v0.16.0-web.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-web.zip)
- [Meowgnificent-v0.16.0-macos.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-macos.zip)
- [Meowgnificent-v0.16.0-source.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-source.zip)
- [Meowgnificent-v0.16.0-SHA256SUMS.txt](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.16.0/Meowgnificent-v0.16.0-SHA256SUMS.txt)

Download the ZIP, extract it, and launch the executable or app. No MSI installer or CMD download command is needed.
