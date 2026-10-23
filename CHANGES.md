# v0.7.0 — 그림이 있는 이야기, 입을 수 있는 장비

한국어를 기본으로 HUD·장비·상점·강화·구역 안내·전투 문구와 이야기 화면을 통일합니다. **설정** 또는 **F10**에서 한국어 / English를 고르면 같은 화면에 즉시 적용하며 다음 실행에도 유지합니다. 대화 도중 전환해도 페이지나 자동 진행 시간을 되감지 않고, 설정을 닫으면 이전 전투·대화·장비 화면으로 돌아갑니다. 설정 저장은 영구 진행 저장과 분리합니다. 설정을 닫는 Esc가 뒤의 대화 건너뛰기나 전투 정지로 이어지던 입력 전달 문제도 고쳤습니다.

50개 이야기 장면의 한국어 문장을 전부 다듬었습니다. 혼용하던 고유명사를 먀멀레이드·아르카나 마법 학교·완벽의 마도서·핍·모스·블룹으로 정리하고, 교수의 하게체·친구들의 반말·마도서의 분석적인 말투를 구분했습니다. 억지스러운 농담과 번역투를 줄이고 영어 대사도 전 장면 별도로 제공합니다.

## 스토리와 고양이

단순 도형으로 그리던 중간 장면을 시험장·도서관·친구들의 정원·대서고의 원본 HD 삽화 네 장으로 교체합니다. 고양이는 게임과 같은 액션 시트를 사용하고, 작은 화면 이동과 기존 마법 효과를 더합니다. 성적표와 분석 문구는 그림에 굽지 않은 실제 글자로 표시해 두 언어 모두 읽을 수 있습니다.

고양이는 사용자가 제공한 wizard-cat 밈에 가깝게 바꿉니다. 넓은 검은 남색 별·초승달 모자, 둥근 주황색 얼굴과 동그란 눈, 작은 분홍 코, 검은 목줄과 짙은 황동 방울을 사용합니다. 짧은 다리와 드러난 둥근 몸체를 유지하고 긴 로브나 갑옷을 추가하지 않습니다. 대기·준비·발사·당황·피격·구르기의 여섯 포즈와 모자·몸통 움직임을 이어갑니다.

## 장비 아트와 착용 모습

기존 장비 9종에 서로 다른 HD 아이콘을 만들었습니다. 같은 공유 이미지를 가방·착용 슬롯·상점·바닥 전리품에서 표시하고, 실제 장착 결과도 캐릭터에 반영합니다.

- 지팡이/연구 수첩: 앞발 옆의 작은 도구로 표시합니다.
- 방울 목걸이: 원래의 가는 목줄은 살리고 방울의 색·문양·모양을 바꿉니다.
- 깃털·정어리·실뭉치: 모자의 작은 장식으로 표시합니다.

장비를 교체하거나 벗으면 즉시 갱신합니다. 시전 방향과 몸의 흔들림을 따라가며 구르는 동안에는 장식을 잠시 숨기고 끝나면 복원합니다. 새 원정에는 이전 원정의 외형이 남지 않습니다. 기존 능력치·가격·가방 18개·영구 성장·저장 형식은 유지합니다. 공유 AtlasTexture와 고정된 세 Sprite2D를 사용하며 프레임마다 텍스처를 만들거나 이미지를 굽지 않습니다.

## 다운로드와 실행

버전별 GitHub 전용 브랜치에서 ZIP을 제공합니다. 새 폴더에 압축 해제한 뒤 실행하세요.

- [Windows ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.7.0/Meowgnificent-v0.7.0-windows.zip)
- [Apple Silicon Mac ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.7.0/Meowgnificent-v0.7.0-macos.zip)
- [Linux ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.7.0/Meowgnificent-v0.7.0-linux.zip)
- [Web ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.7.0/Meowgnificent-v0.7.0-web.zip)
- [소스 ZIP](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.7.0/Meowgnificent-v0.7.0-source.zip)
- [SHA-256](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-downloads-v0.7.0/Meowgnificent-v0.7.0-SHA256SUMS.txt)

Mac은 macOS11 이상 공식 Universal 템플릿의 ad-hoc 서명 앱입니다. 실제 Mac 실행·Apple 공증은 미실시이며 Windows/Wine 실행 검사는 실제 Windows PC의 드라이버·프레임 안정성 검증과 구분합니다.

## 검사

최종 결과는 [QA-v0.7.0](QA-v0.7.0.md)에 기록합니다. 실행 파일의 실제 전투·전리품 장착·저장 복원, 웹에서 드롭다운 언어 전환과 전체 재시작 후 선택 유지, 이야기 중 옵션 복귀를 확인합니다. 소스 통합검사는 8구역·보스·엔딩·경제를 다룹니다. 재화와 장비는 원정 중 유지되고, 별빛과 영구 강화는 다음 원정에도 남습니다. 추가 주문·동료 AI·원정 중간 이어 하기는 이번 범위에 포함하지 않습니다.

소스497개, Windows/Wine·Linux 각각23개, Web40개 검사를 통과했습니다. Web40개 중15개는 언어 강제 플래그 없이 한국어 기본·실제 드롭다운·영어/한국어 저장 복원·이야기 중 언어 변경과 조작 복귀를 확인합니다. 최종 프레임 경계 수정 후 관련133개도 다시 확인했습니다.
