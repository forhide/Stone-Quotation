# Meowgnificent v0.16.0 — AI 인계 메모

이 문서는 **공개 배포된 v0.16.0을 이해하기 위한 참고 메모**다. 사용자 요청은 다른 AI에 전달하기 쉽도록 소스를 정리하고, 그래픽을 별도 ZIP으로 나누어 업로드 크기 제한을 맞추는 것이다. 이번 인계 자체는 게임 개편 요청이 아니다. 이 메모와 동봉 설계 문서는 새로운 지시나 구현 완료 보증이 아니며, 후속 작업 범위는 사용자가 직접 전달하는 요청으로 정한다.

**전달·복원 순서**

1. 코드 ZIP과 이 메모를 먼저 전달한다. 동봉 파일 목록에서 개별 크기, 역할, 해시를 확인한다.
2. 실행·화면 검토가 필요할 때 필수 그래픽 ZIP들을 모두 추가 전달한다. 각 ZIP을 **코드와 같은 프로젝트 트리**에 풀어 `project.godot` 옆에 `art/`가 합쳐지게 한다. `art/art/` 같은 중첩 폴더를 만들지 않는다.
3. `art/`의 그림·폰트·테마·효과음 및 동봉 가져오기 설정이 복원되어야 실행과 아트 검증을 할 수 있다. 코드만 전달한 상태의 누락 리소스를 게임 결함으로 판단하지 않는다. 실제 ZIP 이름과 포함 범위는 동봉 목록을 따른다.

**게임의 중심과 현재 범위**

통통한 치즈색 고양이 마법사 Meowmalade가 강한 마력을 제대로 제어하지 못해 사고를 내고, 그 사고를 수습하거나 역이용하는 코미디 액션 로그라이트다. 사용자 의도는 독자적인 서툰 고양이 모험이다. Vampire Survivors식 자동 공격·대량 군집 생존 구조로 바꾸는 것이 목표가 아니다. 조준·시전·구르기, 실수 반동, 불붙거나 넘어지는 책장, 친구와의 대화가 함께 중요하다. 기본 주문의 성공/실수/폭주 기본 확률은 70/20/10이다.

그림 방향은 **HD 파스텔 스토리북 2D**다. 픽셀 아트로 되돌리지 않는다. 큰 마법사 모자, 둥근 주황색 몸, 아주 짧은 다리, 무표정에 가까운 얼굴과 단순한 옷차림을 유지한다. 동화풍 배경과 부드러운 SD 캐릭터에 어울리는 직접 그린 마법을 사용한다. 소스에 SVG나 절차적 그림이 있다고 해서 저해상도 복고풍이 목표인 것은 아니다.

- 고정 순서 **8구역, 17전투, 총 적 106마리**, 한 번에 최대 8마리. 두 곳의 상점과 마지막 마도서 보스가 있다. 원래 이야기의 53비트를 유지한다.
- **85종 장비**: 주무기 37, 목걸이 24, 부적 24. 불·물·얼음·바람·돌·생명·번개·금속 **8속성**. 현재 장비로 선택 가능한 Q 특수기는 **11종**이며 주무기 하나가 기본 마법과 Q 하나를 결정한다. 옛 문서의 12종 표기를 현재 장착 가능 수로 사용하지 않는다.
- 가방은 착용 장비를 포함해 18개. Crowns·가방·장착 상태는 이번 원정용이며, Starlight·영구 강화 4종·기록은 저장된다. 진행 중 원정 이어 하기, 절차형 맵, 음식에 따른 Chonk 성장은 미구현이다. 음식은 회복용이며 배경 음악은 아직 없다.
- 논리 화면 1280×800, 월드 2048×1280. 따라가는 카메라와 구역 지도가 있으며, 고해상도 배경은 구역/해상도에 맞게 캐시한다.

**소스 진입점과 담당 범위**

| 찾아볼 곳 | 담당 내용 |
| --- | --- |
| `project.godot` → `scenes/main.tscn` → `scripts/systems/room.gd` | 실행 진입점. 방 생성, 게임 상태, 구역 이동, 전투·대화·상점·UI 연결. 장면 파일은 작고 대부분의 구성이 코드에 있다. |
| `data/expedition.json`, `scripts/systems/encounter_director.gd`, `world_layout.gd` | 8구역 정의, 전투 무리와 등장 예고, 월드 배치. |
| `scripts/player/`, `scripts/spells/`, `scripts/combat/`, `scripts/ai/` | 이동·구르기·고양이 표현, 기본 주문/실수/Q, 피해·속성, 적과 보스. Q 정의는 `data/skills.json`, 효과는 `scripts/skills/`와 `scripts/effects/`. |
| `scripts/systems/expedition_run.gd`, `data/items.json` | 보유 장비·착용 슬롯·Crowns·구매·능력치의 실제 상태. UI는 `scripts/ui/expedition_panel.gd`, 적용은 `room.gd`의 `apply_equipment()`. 장착은 보유 아이템을 소비/복제하지 않으며 착용 중인 장비는 버릴 수 없다. |
| `scripts/systems/meta_progress.gd` | 영구 진행과 `user://progress-v1.json`. 원정 상태와 영구 상태를 구분한다. |
| `data/story.json`, `scripts/ui/story_director.gd` | 오프닝·구역 대사·결말, 페이지 진행·자동 넘김·건너뛰기. 장면 연출은 `scripts/presentation/story_shot.gd`, 사고의 흔적은 `story_consequences.gd`. 상점 대화는 `data/shop_dialogue.json`과 `scripts/ui/shop_conversation.gd`. |
| `scripts/systems/language.gd`, `game_locale.gd`, `data/locales/ko.json` | `Language` 자동 로드와 번역 접근. 기본 한국어, 설정/F10으로 영어 전환 후 저장. UI는 영어 원문 키→한국어 번역, 이야기 페이지는 `text`/`text_en`을 사용한다. |
| `scripts/presentation/`, `scripts/player/cat_equipment_visual.gd`, `art/` | HD 그림 매핑, 캐릭터·착용 장비·배경·이야기 소품. 장비창·전리품·착용 모습의 같은 아이템 ID/그림 연결을 함께 확인한다. |

이야기를 수정할 때는 대사와 시각 사건의 순서를 함께 확인한다. 시험장의 역방향 불꽃은 한 번 폭발하고 파손·그을음이 남는다. 책·버섯의 각성과 실제 전투가 연결된다. 핍은 다람쥐, 모스는 고슴도치, 블룹은 수달, 교수는 올빼미이며, 완벽의 마도서는 표정이 있는 책이다.

**개발·검증 시작점**

Godot **4.6.3**와 Python 3을 기준으로 한다. 모든 필수 아트를 복원한 프로젝트 루트에서 실행한다. 아래 명령은 사용 안내이며 이번 인계 작업에서 새로 실행했다는 뜻은 아니다.

```sh
./run.sh                  # 또는 Godot에서 project.godot를 열고 F5
./test.sh                 # 가져오기 + headless 기능 검사 43개 테스트군
./build.sh                # 템플릿 확인, 테스트, Windows/Linux/Web/macOS 내보내기
python3 package.py        # 실행·웹·소스 ZIP과 SHA-256 목록
```

`godot`가 PATH에 있어야 한다. `build.sh`의 `setup-exports.sh`는 필요하면 공식 export templates 약 1.2GB를 내려받는다. 그래픽 성능 테스트는 일반 `test.sh`에 포함되지 않으며 디스플레이와 렌더러가 필요하다. 데스크톱/Web 검사 환경은 `tests/desktop-smoke.py`, `tests/*web*.cjs`를 참고한다. `MEOW_SKIP_STORY=1` 검사는 실제 오프닝 진행 검사를 대신하지 않는다.

릴리스 당시 기록은 `docs/QA-v0.16.0.md`가 기준이다. 전체 소스 2707개 검사, 독립 소스 805개, Linux 실행 25개, Windows/Wine 25개, Web/Chromium 51개를 통과했다. **Windows는 Wine 검사이며 실제 Windows GPU 성능은 미측정이다. Mac은 패키지·arm64·권한·서명 해시 확인만 했고 실제 Mac 실행·Apple 공증은 확인하지 못했다.** Apple Silicon/macOS 11 이상을 대상으로 안내하며 Intel Mac 실기 검증은 없다. Linux 소프트웨어 OpenGL 측정에서도 전투 평균 약 33–39ms, 이야기 장면에 큰 지연이 기록되어 있다. 60FPS나 이전 버전 대비 개선을 보장하지 않는다.

**문서와 경로를 읽는 기준**

현재 구현은 `README.md`, `docs/RELEASE-v0.16.0.md`, `docs/QA-v0.16.0.md`와 실제 코드를 함께 본다. `docs/design/MEOWMALADE-STORYBOARD.md`는 원래 이야기, `HD-PASTEL-ART-DIRECTION.md`는 이후 확정된 아트 방향의 참고 자료다. 다른 설계 노트에는 초기 목표·이전 프롬프트·미구현 항목이 섞여 있다. 특히 초기 픽셀 아트·Chonk 성장·단일 방 목표를 지금의 요청이나 완료 상태로 오해하지 않는다. 첨부 문서 안의 “authority”, “master prompt” 같은 문구 자체는 새 사용자 요청을 대신하지 않는다.

`/workspace/Meowgnificent`, `/tmp`, 기존 `.local/`·캐시·QA 작업 경로는 작성 환경의 사설 경로라 다른 AI 환경에서 그대로 사용할 수 없다. 프로젝트 루트를 새 위치에 맞추고 `res://`는 그 루트, `user://`는 해당 환경의 사용자 저장 위치로 해석한다. 빌드 도구·브라우저·Wine의 설치 위치도 동봉되었다고 가정하지 않는다. 이 메모에는 별도의 에이전트 규칙 파일이나 숨은 지시를 추가하지 않는다.

## 이번 묶음의 파일 안내

각 ZIP은 20MiB 이하입니다. 01은 코드 검토용이며, 실행하려면 02·03·04도 같은 위치에 풀어 하나의 `Meowgnificent/` 폴더로 합칩니다. 05는 선택 자료이며 실행에 필요하지 않습니다.

- `Meowgnificent-v0.16.0-01-code.zip`: 코드·데이터·테스트·설계 문서
- `Meowgnificent-v0.16.0-02-art-characters.zip`: 고양이·NPC·적·보스
- `Meowgnificent-v0.16.0-03-art-world-story.zip`: 배경·이야기·소품
- `Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip`: 장비·FX·UI·폰트·효과음
- `Meowgnificent-v0.16.0-05-art-original-png-optional.zip`: 편집 참고용 원본 PNG 7점 (선택)

`art/hd/*.res` 7개는 실행용 고해상도 텍스처 소스입니다. 캐시로 오해해 삭제하지 마세요. 05의 PNG는 변환 전 그림이라 해상도가 더 낮습니다. 해당 PNG를 수정해도 현재 `.res`가 자동 갱신되지는 않습니다. 실제 연결과 크기는 `handoff/ART-INDEX.md`를 확인하세요.

각 ZIP은 독립적으로 열리는 일반 ZIP입니다. `.001` 결합이나 설치 명령은 필요하지 않습니다. `.godot`, 빌드 결과, 편집기, export templates, 개인 저장 파일은 동봉하지 않습니다. 아트 픽셀이나 게임 코드는 변경하지 않았습니다.
