# v0.9.0 QA

최종 소스와 실행 파일의 확인 범위를 구분합니다. Mac 실기 실행과 실제 Windows 하드웨어 FPS는 미검증입니다.

| 항목 | 결과 | 범위 |
| --- | --- | --- |
| Source |802개/15suite 통과| 장비36종, 스킬121검사, 경제28, 원정109, 이야기77, 외형/언어100, 발 디딤28, 공격 예고54 등 |
| Windows/Wine |23개 통과| 실제 입력·전투·구역02·드롭/착용·패배·새 프로세스 저장 복원, 엔진 오류 없음 |
| Linux |23개 통과| 같은 실행 흐름과 재시작 저장 복원, 엔진 오류 없음 |
| Web |48개 통과| 기본 전투15, 이야기10, 한국어/언어 저장15, 실제 Q/우클릭8. HTTP/JS/엔진 오류 없음 |
| Mac package |통과| ZIP,0.9.0메타데이터, arm64, 실행권한, PCK,9리소스 해시/89,490코드 페이지. 실기/공증은 미검증 |
| Visual review |연출된 소스 장면 검토|12종 스킬,36아이콘/착용, 낮은 발 디딤, 새 불꽃, 원본 노트의 지하 창고·책 정렬·격자 버섯·친구 장면. 자연스러운 전체 캠페인 완주 증거와 구분 |
| Performance |3조건 순차 측정|같은 경고 장면155.82→161.88drawcalls,6페이지 스킬 추가182.71. 클라우드 시간 변동, FPS 개선 단정 없음 |
| Delivery |packaging|게시 뒤 다섯 ZIP/체크섬 새 다운로드와 SHA-256·압축 무결성·실행 payload 일치 확인 |

[소스 로그](qa/v090-source-tests.txt), [Windows](qa/v090-windows-tests.txt), [Linux](qa/v090-linux-tests.txt), [Web](qa/v090-web-tests.txt), [이야기](qa/v090-story-web-tests.txt), [언어](qa/v090-localized-web-tests.txt), [Q/우클릭](qa/v090-item-skills-web-tests.txt), [Mac](qa/v090-macos-package.txt), [측정 방법](qa/v090-performance/METHOD.md).

전체8구역·최종 보스·결말은 소스 통합 검사로 확인합니다. 실행 파일 입력 검사는 튜토리얼과 구역02, 저장 복원까지입니다. 스킬121검사는12종의 실제 피해, 속박/감속/방어, 지연 타격, 실수/폭주, 보스 장벽, 일시정지, 보유/착용 검증, 무기 교체·구역 변경 후 공용 대기 시간, 종료 시 정리까지 확인합니다.

새 상점 설명이 길어도 KO/EN 돌아가기 버튼이1280×800 안에 있고 네 구매 항목이 유지되는지 실제 렌더링에서 확인했습니다. 재고 영역은 스크롤할 수 있습니다. GUI 자동화는 키를 재전송하지 않고 화면 전환을 기다려 클라우드의 느린 프레임을 구분합니다.

시각 증거: [장비/스킬](qa/v090-inventory-skills-ko.png), [상점](qa/v090-shop-skills-ko.png), [불꽃 부채](qa/v090-skill-cinder_fan.png), [닭 돌진](qa/v090-skill-chicken_dash.png), [덩굴](qa/v090-skill-vine_snare.png), [방어막](qa/v090-skill-bubble_guard.png), [지하 창고](qa/v090-stage-01-preview.png), [도서관](qa/v090-stage-02-preview.png), [실제 정원](qa/v090-stage-03-play.png), [친구들](qa/v090-stage-05-friends.png), [파이어볼](qa/v090-fireball-close.png), [걸음](qa/v090-gait-03.png).
