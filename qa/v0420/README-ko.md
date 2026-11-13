# v0.42.0 실행 검증 자료

- `test-results.json`: 전체62군·4,205검사·실패0·엔진 오류0.
- `build-proof.json`, `source-proof.json`: 빌드 소스, 버전7곳, 실제 Windows PE0.42.0.0.
- `linux/`: 새 실행 ZIP 일반 입력6검사. `web/`: PC·터치16검사.
- `audio/`: 실제 브라우저 음악 출력과 중단 후 재개7검사.
- `pwa/`: v0.41.1→v0.42.0 갱신·저장소 유지·오프라인7검사.

실제 Mac/Windows/iPhone 실행, 실기 프레임/오디오 끊김, 사람이 듣는 음질 검증은 아니다. PWA는 manifest의index.html로 오프라인 재실행하며 임의 진단 주소 전체가 오프라인 캐시된다는 주장을 하지 않는다.

재현하려면 세 검사 도구를 .local/release-v0420/에 복사한다. unpacked-linux/에 해당 ZIP을 풀고, web-old/에는 공식 v0.41.1 웹 ZIP의index.*를 둔다. exports/web에는 v0.42.0을 내보낸다. 서버8094는 exports/web,8095는update-site를 제공한다. native-check.py는 DISPLAY=:88, 웹 도구는 Node/playwright·Chromium·tesseract가 필요하다. tests/web-audio.cjs의 두 인자는 로컬 웹 URL과 별도 결과 폴더다. 실제 사용자 프로필은 사용하지 않는다.
