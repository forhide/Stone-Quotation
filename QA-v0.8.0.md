# v0.8.0 QA

정예 경고 scale 보정을 포함한 최종 소스·Windows/Wine·Linux·웹 검증과 Mac 패키지 검사를 완료했습니다. 실제 Mac 실행과 Windows 실기 성능은 포함하지 않습니다.

| 항목 | 상태 | 확인 범위 |
| --- | --- | --- |
| Source | pass | 13개 suite, 584 checks, 0 failures; 발 디딤23·이야기68·공격 예고54 포함 |
| Linux executable | pass | 23개 실제 입력·화면 검사, 전투·구역02·장비·패배·새 프로세스 저장 복원 |
| Windows executable / Wine | pass | 23개 실제 키·마우스/화면 검사, 튜토리얼 전투·구역02·장비 드롭/착용·패배·재실행 저장 복원; 실제 Windows PC 실행과 구분 |
| Web | pass | 전투15·기본 이야기10·한국어/설정/언어 저장15, 총40개; HTTP/JS/엔진 오류 없음 |
| Mac package | pass | ZIP, metadata0.8.0, 권한, arm64, PCK, 9개 리소스/89,490개 코드 페이지 ad-hoc 서명 해시. Mac 실기 실행은 미검증 |
| Visual review | staged review | 고양이 톤·접지·8구역 배경/소개·적별 예고를 연출된 소스 장면에서 확인. 아래 증거 링크 참고; 자연스러운 완주·실제 입력 검사는 별도 |
| Performance | measured | 총8회 원시 측정 보존. 새 경고를 quad로 묶어 draw366.58→최종159.13; 정예 scale 보정·구버전 대조 추가. CPU quota와 불안정한 시간 꼬리 기록; FPS 향상 단정 없음. [방법/수치](qa/v080-performance/METHOD.md) |
| Delivery | packaging | 실행 검증한 파일을 ZIP으로 패키징하며, 게시 후 새 다운로드의 크기·SHA-256·압축 무결성을 별도로 검증함 |

실제 Mac 실행과 실제 Windows 하드웨어 성능은 이 클라우드 검증에 포함하지 않습니다. 통과 수와 측정 수치는 결과를 수집한 뒤 기록합니다.

소스 원시 결과: [v080-source-tests.txt](qa/v080-source-tests.txt). GUI 렌더링 품질과 실제 플랫폼 입력 검사는 별도로 수행합니다.


## 렌더링 검토 증거

아래는 위치·동작·공격 준비 상태를 정해 촬영한 소스 렌더링 장면입니다. 실제 입력으로 원정을 완주했다는 증거가 아니며 실행 파일 입력 검사는 별도로 기록합니다.

- 고양이 톤: [확대](qa/v080-cat-tone-close.png), [정원](qa/v080-cat-tone-garden.png).
- 발 디딤: [동작 GIF](qa/v080-walk-contact.gif), [자세00](qa/v080-gait-00.png), [자세03](qa/v080-gait-03.png). GIF의 화면 읽기와 캡처 간격은 프레임 측정에 영향을 주므로 FPS 근거로 사용하지 않습니다.
- 공격 예고: [창고](qa/v080-telegraphs-storage.png), [도서관](qa/v080-telegraphs-library.png), [정원](qa/v080-telegraphs-garden.png), [심사관](qa/v080-telegraphs-examiner.png).

| 구역 | 입장 전 배경 | 실제 구역 |
| --- | --- | --- |
| 01 | [소개](qa/v080-stage-01-preview.png) | [플레이](qa/v080-stage-01-play.png) |
| 02 | [소개](qa/v080-stage-02-preview.png) | [플레이](qa/v080-stage-02-play.png) |
| 03 | [소개](qa/v080-stage-03-preview.png) | [플레이](qa/v080-stage-03-play.png) |
| 04 | [소개](qa/v080-stage-04-preview.png) | [플레이](qa/v080-stage-04-play.png) |
| 05 | [소개](qa/v080-stage-05-preview.png) | [플레이](qa/v080-stage-05-play.png) |
| 06 | [소개](qa/v080-stage-06-preview.png) | [플레이](qa/v080-stage-06-play.png) |
| 07 | [소개](qa/v080-stage-07-preview.png) | [플레이](qa/v080-stage-07-play.png) |
| 08 | [소개](qa/v080-stage-08-preview.png) | [플레이](qa/v080-stage-08-play.png) |

[마지막 분석](qa/v080-stage-08-analysis.png), [결말 배경](qa/v080-stage-ending-boom.png). 선택한 총27개 그림/영상의 목록과 크기는 [증거 목록](qa/v080-visual-evidence.json)에 기록합니다.


실행 원시 결과: [Windows23](qa/v080-windows-tests.txt), [Linux23](qa/v080-linux-tests.txt), [Web15](qa/v080-web-tests.txt), [기본 이야기10](qa/v080-story-web-tests.txt), [한국어/언어 저장15](qa/v080-localized-web-tests.txt), [Mac 패키지](qa/v080-macos-package.txt).

초기 Windows/Linux 자동화에서 키 입력 뒤 고정100~150ms 캡처가 이전 화면을 읽었습니다. 키를 재전송하지 않고 실제 화면 전환을 기다리도록 테스트를 수정한 뒤 최종 실행본의 모든 검사를 통과했습니다.
