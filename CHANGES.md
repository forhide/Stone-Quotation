# v0.9.0 — 장비 특수 스킬과 원래 시나리오의 모험

## 변경 범위

- 걷기의 발 들기·발끝 회전·몸 튀기를 줄이고 발 디딤과 모자의 박자를 맞춥니다. 이동한 거리에 따른 바닥 접촉은 유지합니다.
- 장비를 9종에서 36종으로 늘립니다. 지팡이·목걸이·장식을 각각 12종 준비하고, 가방은 장착한 물건을 포함해 18칸을 유지합니다. 상점은 구역 단계와 장비 슬롯에 맞춰 물건을 고르며, 이미 방문한 상점의 재고는 메뉴를 다시 열어도 바뀌지 않습니다.
- 착용 주무기마다 다른 특수 스킬 하나를 제공합니다. Q 또는 마우스 오른쪽 클릭으로 사용하며 주무기를 바꾸어도 남은 대기 시간이 초기화되지 않습니다. 목걸이·장식은 주문·생존·이동·스킬 능력치를 조합합니다.
- 화염구의 둥글고 밝은 불꽃 핵, 주황·빨강 불꽃, 가늘어지는 꼬리를 분명히 보여줍니다.
- [원래 시나리오 노트](design/MEOWMALADE-STORYBOARD.md)의 지하 창고·정렬된 책·격자 버섯·낙제생 친구들·완벽의 마도서의 통제를 이야기 중심으로 복원합니다. 한국어 대사와 영어를 함께 고치고, 이야기와 실제 구역에 같은 장소·현상을 보여줍니다.

기본 한국어 UI·설정 언어 저장, 8구역의 6전투·2상점, 영구 강화와 기존 장비 ID는 유지합니다. 특수 스킬도70/20/10 성공·실수·폭주를 유지합니다. 초반 연습용 지팡이는 기본 공격을 강화하지 않으며 첫 구역부터 특수 스킬을 사용할 수 있습니다.

## 특수 스킬

한 번에 착용 주무기의 스킬 하나를 Q/우클릭으로 씁니다. 주무기 교체와 구역 변경으로 대기 시간을 초기화할 수 없으며 메뉴에서는 시간이 멈춥니다. 목걸이·장식으로 스킬 피해·범위·회복 시간을 조합합니다.

| 주무기 | 특수 스킬 | 효과 |
| --- | --- | --- |
|삐뚤빼뚤 물푸레 지팡이|불씨 고리|퍼져 나가는 불씨 고리로 가까운 적들을 밀어냅니다.|
|잿불 갈래 지팡이|불꽃 부채|불덩이 다섯 개를 부채꼴로 쏩니다.|
|견습생의 연구 수첩|달아난 각주|마법에 걸린 책장 여섯 장이 잠시 주위를 돌며 가까운 적을 때립니다.|
|연습용 지팡이|주머니 불꽃|조준한 곳에 작은 불꽃이 터집니다. 작아도 꽤 쓸모가 있습니다.|
|서리 수염 지팡이|서리 수염|앞쪽에 서리를 뿜어 피해를 주고 적의 이동을 늦춥니다.|
|깡충 지팡이|폴짝, 펑!|짧은 거리를 순간이동한 뒤 도착한 곳에서 마력이 터집니다.|
|핍의 깃털 지팡이|분명히 용이었는데|의욕 넘치는 닭을 불러 적들 사이로 돌진시킵니다.|
|모스의 새싹 지팡이|덩굴 인사|덩굴이 적의 발을 붙잡고, 덩굴밭이 반복해서 피해를 줍니다.|
|블룹의 물약 지팡이|블룹의 자신작|물약을 포물선으로 던집니다. 바닥에 떨어지면 폭발합니다.|
|천둥 숟가락|우르릉 세 번|조준한 방향을 따라 번개 세 줄기가 차례로 떨어집니다.|
|거품 찻주전자|한 모금 방울막|잠시 동안 피해를 막아 주는 방울막을 만듭니다.|
|혜성 크레용|하늘에서 온 낙서|조준한 곳 주변에 작은 혜성 네 개가 차례로 떨어집니다.|

## 검증

자동 검사802개(특수 스킬121개 포함), Windows/Wine·Linux 실행 각각23개, Web48개를 통과했습니다. 원래 시나리오 노트를 보존하고50장면의 한·영 대사를 다듬었으며 변경된 장소와 현상을 실제 구역에도 반영했습니다. Mac은 패키지·서명 해시 검사까지이며 실기 실행과 Apple 공증은 미검증입니다. 클라우드 소프트웨어 렌더링 수치를 실제 Windows/Mac FPS로 해석하지 않습니다. [정확한 범위와 원시 증거](QA-v0.9.0.md).

## 다운로드

ZIP을 새 폴더에 풀고 실행 파일 또는 Mac 앱을 실행하세요.

- [Windows64-bit](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.9.0/Meowgnificent-v0.9.0-windows.zip)
- [Apple Silicon Mac](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.9.0/Meowgnificent-v0.9.0-macos.zip)
- [Linux64-bit](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.9.0/Meowgnificent-v0.9.0-linux.zip)
- [Web 배포본](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.9.0/Meowgnificent-v0.9.0-web.zip)
- [Godot 소스](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.9.0/Meowgnificent-v0.9.0-source.zip)

[SHA-256 목록](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.9.0/Meowgnificent-v0.9.0-SHA256SUMS.txt). 공개 뒤 직링크에서 모든 파일을 새 다운로드해 크기·해시·ZIP 무결성을 별도로 확인합니다.
