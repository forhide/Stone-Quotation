# Meowgnificent v0.20.0

크리티컬 반동과 실수에 체력 비용을 더하고, 진행 안내·대화·충돌·마법 그림을 정리한 버전이다.

- 크리티컬 폭주 반동은 체력5, 마법 실패는 체력10. 기본/특수기 방출 시 적용하고 성공·취소는 무료다. 방어·무적을 우회하며 치명 비용은 방출 전에 패배 처리한다. 통조림으로 회복한다.
- 미업그레이드 적은 구역 기준 체력×1.15 올림, 속도×1.16, 피해+5, 공격 뒤 회복0.7초다. 이전×1.08/+3/0.85초보다 어렵다. 기존 저장과 영구 연구는 유지한다.
- 크리티컬·실수 혼잣말은 고양이 옆 말풍선으로 표시한다. 다음 전투 목적과 마법진 접근 안내는 별도 카드에 계속 남긴다.
- 모든 동물 친구는 E로 대화하고 마지막 페이지에서 닫힌다. 읽는 동안 이동은 멈추고 동물의 모션은 이어진다. 핍과의 대화도 E이며 구매는 테이블 앞에서만 연다.
- R 초기화를 제거했다. Esc 메뉴는 계속하기·새로 시작·메인 메뉴로의 세 가지 동작이다.
- 배경 화분·가구·정원 표식·NPC·닭·열린 게이트를 공통 바닥 충돌과 연결했다. 표식·친구·게이트의 앞뒤 가림을 맞추고 적/전리품을 장애물 밖에 배치한다.
-8속성 일반/크리티컬 마법을16개의 별도 손그림으로 교체했다. 크리티컬은 일반탄을 크게 늘리지 않는다. 특수기에도 같은 재질의 짧은 여운을 더했다.
- 새 목걸이 펜던트와 줄을 연결하며 무기 변경 뒤에도 유지한다. 목 부분은 원본 픽셀을 보존한 작은 무손실 패치로 포장했다.

[검증 기록](QA-v0.20.0.md): 소스3,386검사, 독립 소스1,484검사, Linux/Windows ZIP 각각25검사, Web53검사. Windows는 Wine, Mac은 패키지 검사이며 실제 해당 기기 GPU 실행 검사는 아니다.

Windows·Apple Silicon Mac ZIP은 엔진 설치 없이 실행한다. ZIP의 모든 파일을 같은 새 폴더에 푼다. 실행 파일·전체 소스와20MiB 미만 코드/그래픽 세트를 같은 버전으로 제공한다. 다운로드 후 명령어 입력이나 MSI 설치를 요구하지 않는다.


## Direct downloads

- [Meowgnificent-v0.20.0-windows.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.20.0/Meowgnificent-v0.20.0-windows.zip)
- [Meowgnificent-v0.20.0-linux.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.20.0/Meowgnificent-v0.20.0-linux.zip)
- [Meowgnificent-v0.20.0-web.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.20.0/Meowgnificent-v0.20.0-web.zip)
- [Meowgnificent-v0.20.0-macos.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.20.0/Meowgnificent-v0.20.0-macos.zip)
- [Meowgnificent-v0.20.0-source.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.20.0/Meowgnificent-v0.20.0-source.zip)
- [Meowgnificent-v0.20.0-SHA256SUMS.txt](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.20.0/Meowgnificent-v0.20.0-SHA256SUMS.txt)

Download the ZIP, extract it, and launch the executable or app. No MSI installer or CMD download command is needed.

[같은 버전 코드·그래픽 인계 세트 — ZIP마다20MiB 미만](https://github.com/forhide/Stone-Quotation/tree/meowgnificent-handoff-v0.20.0)
