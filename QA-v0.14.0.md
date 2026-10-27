# v0.14.0 QA

소스·실행·웹·그림·패키지 검증을 완료했습니다. 전달 결과는 새 다운로드 검증 기록으로 확인합니다.

| 항목 | 결과 | 확인 범위 |
| --- | --- | --- |
| Source | 1777개 / 35suite 통과 | 전체 회귀 및 사건 순서·파손 유지·그을림·페이지/장소/옵션 전환 |
| Windows / Wine | 25개 통과 | 새 실행 파일25개 입력·전투·장비·저장 복원 |
| Linux | 25개 통과 | 같은25개 네이티브 실행 검사 |
| Web | 48개 통과 | 기본·대화·한영 설정·특수기 |
| Mac package | 통과 | 버전·arm64·실행 권한·PCK·리소스와 코드 서명 해시 |
| Visual review | 확인 | 과녁 방향, 망가진 교실, 두 배우의 그을림, 책/버섯의 단계별 각성 |
| Performance | 측정 완료 | v0.13과 새 세 이야기 장면의 실제 순차 렌더링. 소프트웨어 렌더러 단일 회차이며 GPU 성능 보장 범위가 아님 |
| Source package | 독립 실행149개 통과 | 독립 소스 압축 해제·코드/아트 일치·실행 |
| Delivery | 대기 | GitHub 직링크 새 다운로드·크기·SHA-256·ZIP 무결성·검사한 실행 파일 일치 |

실제 Windows 하드웨어 FPS, Mac 실기 실행과 Apple 공증은 확인되지 않았습니다.

실제 기록: [소스](qa/v0140-source-tests.txt), [Windows](qa/v0140-windows-results.json), [Linux](qa/v0140-linux-results.json), [Web 기본](qa/v0140-web-tests.txt), [Web 대화](qa/v0140-story-web-tests.txt), [Web 한영 전환](qa/v0140-localized-web-tests.txt), [Web 특수기](qa/v0140-item-skills-web-tests.txt), [Mac 패키지](qa/v0140-macos-package.txt), [성능 조건](qa/v0140-performance/METHOD.md), [성능 원시 비교](qa/v0140-performance/comparison.json), [새 장면 캡처](qa/v0140-capture.log).

성능은1280×800 GL Compatibility/llvmpipe에서 같은 세 시퀀스를 순차 렌더링한 단일 회차입니다. 큰 비용 회귀가 없는지 확인하는 점검이며 캐시·가상화 변동을 포함하므로 향상률이나 실제 Windows GPU FPS를 보장하지 않습니다. 모든 잔해와 문양은 한정된 그림 명령을 재사용하고 전투 위험 요소를 생성하지 않습니다.

소스를 독립 폴더에 풀어 활성 코드·아트가 내보내기 원본과 일치하는지 확인하고 게임·HD 그림·대화 연속성·설정·새 사건 연출149개를 재실행했습니다. 비어 있는 Godot 글꼴/테마 캐시의 최초 import에는 부트스트랩 메시지가 있어 다시 가져왔으며 두 번째 import와 실행은 정상입니다. 완성된 실행 파일에는 이 과정이 필요하지 않습니다. [독립 소스 결과](qa/v0140-source-package-verification.json).
