# v0.8.0 — 파스텔 톤·발 디딤·장소와 공격 예고

## 변경 범위

- 원본 마법사 고양이의 얼굴·실루엣·검은 별무늬 모자 정체성은 유지하고, 털과 명암을 배경과 어울리는 부드러운 HD 파스텔 스토리북 채색으로 맞춥니다.
- 전신을 흔드는 이동을 다듬어 두 발의 교대 디딤, 바닥 접촉과 몸의 무게 이동이 보이도록 수정합니다. 장비 외형과 구르기·시전 동작도 이어집니다.
- 구역 시작 전 이야기에서 해당 플레이 구역의 배경과 장식을 보여주고, 한국어·영어 설명을 실제로 보이는 장소의 특징에 맞춥니다.
- 적의 공격 예고를 실제 공격 거리·폭·고정된 방향에 맞추며 준비가 진행되는 정도와 발동 순간을 구별하도록 다듬습니다. 전투 균형은 유지합니다.

기존의 한국어 기본 UI·설정 언어 변경 및 저장, 50장면 이야기, 장비 9종과 착용 외형, 6전투·2상점의 8구역 로그라이트 구조를 유지합니다.

## 검증

소스 자동 검사584개, Windows/Wine·Linux 실행 검사각23개, 웹 실행40개를 통과했습니다. 실행 검사는 실제 입력으로 튜토리얼 전투, 구역02 이동, 드롭·장비 착용, 패배와 새 프로세스 저장 복원까지 확인합니다. 전체8구역·보스·결말은 소스 통합 검사로 확인합니다. Mac은 ZIP·버전·arm64·실행 권한·PCK·임시 서명 해시를 검증했으며 Mac 실기 실행과 실제 Windows 하드웨어 FPS는 미검증입니다.

확대된 적의 외형 크기가 바닥 예고까지 키우던 오차와 마지막 물리 틱이 돌진 끝점을 넘는 버그를 고쳤습니다. 공격 속도·설정 시간·피해 수치는 유지합니다. 예고는 적 외형 배율과 별도로 실제 판정 크기를 표시합니다.

공격 예고를 한 장의 셰이더 사각형으로 묶어,8개 동시 예고 장면의 평균 draw call을 초기366.58에서 최종159.13으로 줄였습니다. 클라우드 CPU 제한에 따른 프레임 시간 변동이 확인되어 전체 FPS 향상을 단정하지 않습니다. [QA 기록](QA-v0.8.0.md)과 원시 측정에 방법·범위를 기록했습니다.

## 다운로드

ZIP을 새 폴더에 풀고 실행 파일 또는 Mac 앱을 실행하세요.

- [Windows64-bit](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.8.0/Meowgnificent-v0.8.0-windows.zip)
- [Apple Silicon Mac](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.8.0/Meowgnificent-v0.8.0-macos.zip)
- [Linux64-bit](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.8.0/Meowgnificent-v0.8.0-linux.zip)
- [Web 배포본](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.8.0/Meowgnificent-v0.8.0-web.zip)
- [Godot 소스](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.8.0/Meowgnificent-v0.8.0-source.zip)

[SHA-256 목록](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.8.0/Meowgnificent-v0.8.0-SHA256SUMS.txt). 공개 후 모든 파일을 새로 내려받아 크기·해시·ZIP 무결성을 확인하는 별도 전달 검증을 수행합니다. Mac 앱은 임시 서명만 있고 Apple 공증은 없습니다.
