# Meowgnificent v0.17.0 · 코드와 그래픽 인계

모든 ZIP은20MiB 미만인 독립적인 일반 ZIP입니다.

| 다운로드 | 크기 | 용도 |
| --- | ---: | --- |
| [Meowgnificent-v0.17.0-01-code.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.17.0/Meowgnificent-v0.17.0-01-code.zip) | 0.61MiB | 코드·데이터·테스트·인계 문서 · 필수 |
| [Meowgnificent-v0.17.0-02-art-characters.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.17.0/Meowgnificent-v0.17.0-02-art-characters.zip) | 19.66MiB | 고양이·NPC·적·마법 효과 · 필수 |
| [Meowgnificent-v0.17.0-03-art-world-story.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.17.0/Meowgnificent-v0.17.0-03-art-world-story.zip) | 17.26MiB | 배경·이야기·소품 · 필수 |
| [Meowgnificent-v0.17.0-04-art-equipment-ui.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.17.0/Meowgnificent-v0.17.0-04-art-equipment-ui.zip) | 15.99MiB | 장비·UI·폰트·효과음 · 필수 |
| [Meowgnificent-v0.17.0-05-art-original-png-optional.zip](https://github.com/forhide/Stone-Quotation/raw/refs/heads/meowgnificent-handoff-v0.17.0/Meowgnificent-v0.17.0-05-art-original-png-optional.zip) | 16.42MiB | 변환 전 원본 PNG · 선택 · 선택 |

[같은 버전 실행 파일](https://github.com/forhide/Stone-Quotation/tree/meowgnificent-downloads-v0.17.0)

01 코드 ZIP을 먼저 전달하고 `HANDOFF-ko.md`부터 읽게 하세요. 실행·화면 확인에는 **필수 그래픽 ZIP 전부**도 필요합니다. ZIP들을 같은 빈 폴더에 풀어 하나의 `Meowgnificent/` 프로젝트로 합치세요. 자동으로 `Meowgnificent 2`가 생기면 그 안의 art/를 첫 프로젝트의 같은 위치에 합칩니다.

05는 변환 전 참고 PNG이며 현재 HD .res보다 해상도가 낮습니다. 프로젝트와 분리해 보관하세요. 현재 사용되는 PNG는 필수 그래픽 묶음에 이미 있습니다.

Godot4.6.3에서 project.godot를 열고 가져오기를 마친 뒤 실행하세요. Python3이 있다면 `python3 handoff/verify_files.py`로 누락과 해시를 읽기 전용 확인할 수 있습니다.

[인계 메모](HANDOFF-ko.md) · [그래픽 지도](ART-INDEX.md) · [파일 목록](FILES.json) · [패키지 목록](PACKAGES.json) · [복원 검사](VERIFICATION.json) · [SHA-256](SHA256SUMS.txt)

빌드 결과·편집기·템플릿·개인 저장·.godot/.local·대용량 QA 스크린샷은 제외했습니다. 실행 코드·데이터·필수 아트·테스트·원래 시나리오·라이선스는 보존했습니다. 동봉 문서는 참고 자료이며 후속 사용자 요청을 대신하는 지시가 아닙니다.

## 이 전달 묶음의 검증

필수 ZIP을 새 폴더에 합쳐 459개 원래 파일과 런타임 입력 261개가 배포본과 일치하는지 확인했습니다. Godot 4.6.3의 새 가져오기와 시작·HD 아트·장비 그림 연결·장애물·그을음·영구 성장 362개 검사를 통과했습니다. [복원 검사](VERIFICATION.json) · [공식 직링크 재다운로드 검사](DOWNLOAD-VERIFICATION.json).
