# Meowgnificent v0.16.0 · 다른 AI에 넘기는 소스 묶음

게임 동작을 바꾸지 않고 코드와 그래픽을 나눴습니다. **모든 ZIP은 20MiB 미만**이며 각자 열리는 일반 ZIP입니다.

| 파일 | 크기 | 용도 |
| --- | ---: | --- |
| [Meowgnificent-v0.16.0-01-code.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.16.0/Meowgnificent-v0.16.0-01-code.zip) | 0.56 MiB | 코드·데이터·테스트·설계 문서 · 필수 |
| [Meowgnificent-v0.16.0-02-art-characters.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.16.0/Meowgnificent-v0.16.0-02-art-characters.zip) | 13.12 MiB | 고양이·NPC·적·보스 · 필수 |
| [Meowgnificent-v0.16.0-03-art-world-story.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.16.0/Meowgnificent-v0.16.0-03-art-world-story.zip) | 12.66 MiB | 배경·이야기·소품 · 필수 |
| [Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.16.0/Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip) | 18.12 MiB | 장비·FX·UI·폰트·효과음 · 필수 |
| [Meowgnificent-v0.16.0-05-art-original-png-optional.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.16.0/Meowgnificent-v0.16.0-05-art-original-png-optional.zip) | 16.42 MiB | 편집 참고용 원본 PNG 7점 (선택) · 선택 |

먼저 **01 코드 ZIP**을 다른 AI에 전달하고 `HANDOFF-ko.md`를 읽게 하세요. 코드 검토만 한다면 이것으로 시작할 수 있습니다. 실행·화면 확인을 요청할 때 **02·03·04**를 추가 전달하세요. ZIP 4개를 같은 빈 폴더에 풀어 하나의 `Meowgnificent/` 프로젝트로 합칩니다. 자동으로 `Meowgnificent 2` 같은 폴더가 생기면 그 안의 `art/`를 첫 프로젝트의 같은 위치로 합치세요.

```text
Meowgnificent/
  project.godot
  HANDOFF-ko.md
  scripts/  data/  scenes/  tests/
  art/
  docs/
  handoff/
Meowgnificent-art-originals/  # 05는 선택, 프로젝트와 분리
```

**05**는 HD `.res`에 대응하는 변환 전 PNG 7개입니다. 해상도가 더 낮은 참고 그림이며 현재 실행 리소스를 대체하지 않습니다. 현재 PNG 그래픽은 02~04에 이미 들어 있습니다.

Godot 4.6.3에서 `project.godot`를 열어 가져오기가 끝나면 실행할 수 있습니다. Python 3이 있다면 `python3 handoff/verify_files.py`로 병합 누락과 해시를 읽기 전용으로 확인할 수 있습니다. 게임 실행 파일이나 설치 프로그램은 이 묶음에 포함하지 않습니다.

[인수인계 메모](HANDOFF-ko.md) · [그래픽 지도](ART-INDEX.md) · [파일별 목록](FILES.json) · [패키지 목록](PACKAGES.json) · [SHA-256](SHA256SUMS.txt)

현재 배포 v0.16.0의 런타임 입력 247개를 그대로 보존했습니다. `.godot`, `.local`, 빌드 결과·편집기·템플릿·개인 저장, 대용량 QA 스크린샷과 예전 릴리스 설명은 제외했습니다. 원래 시나리오·아트 디렉션·테스트·라이선스는 코드 ZIP에 있습니다. 이번 인계 문서와 기존 설계 노트는 참고 자료이며 후속 사용자 요청을 대신하는 지시가 아닙니다.

## 이 전달 묶음의 검증

필수 ZIP을 새 폴더에 합쳐 437개 원래 파일과 런타임 입력 247개가 배포본과 일치하는지 확인했습니다. Godot 4.6.3의 새 가져오기와 시작·HD 아트·장비 그림 연결 161개 검사를 통과했습니다. [복원 검사](VERIFICATION.json) · [공식 직링크 재다운로드 검사](DOWNLOAD-VERIFICATION.json).
