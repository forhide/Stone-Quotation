# v0.41.1 실행 검증 자료

- `test-results.json`, `build-proof.json`, `source-proof.json`: 전체61군·4,131검사·실패0, 내보내기4종, 게임 로직/데이터 변경 없음과 실제 버전 기록.
- `linux/`: 새 ZIP에서 실행한 실제 Linux 프로그램,6검사.
- `web/`: 내보낸 웹/WASM PC·터치15검사와 v0.41.1 버전 배지.
- `pwa/`: 이전 캐시에서 새 버전으로 업데이트하고 manifest 시작 주소로 오프라인 재실행한7검사. 브라우저 저장소 표식 유지 확인이며 실제 게임 저장 호환은 전체 자동 테스트의 checkpoint 검사가 담당한다.

화면은 실제 Linux 렌더러/Chromium이다. Windows/Mac/실제 iPhone 실행 또는60FPS 측정 자료가 아니다. 진단 옵션이 붙은 루트 주소의 오프라인 새로고침은 실패했으며 실제 PWA 시작 주소(index.html)를 구분했다.

재현 도구3개는 사용한 원본 그대로 보관했다. 실행할 때 `.local/release-v0411/`에 복사하고, `unpacked-linux/`에는 해당 실행 ZIP, `web-old/`에는 v0.41.0 웹 ZIP을 푼다. 프로젝트의 `exports/web`은 v0.41.1이어야 한다. 서버8085는 새exports/web,8086은도구가 갱신하는update-site를 제공한다. 브라우저 도구는 Node/playwright·Chromium·tesseract가 필요하다. `native-check.py`는 DISPLAY=:88에서 실행한다. 실제 사용자 프로필 대신 임시 검사 프로필을 쓴다.
