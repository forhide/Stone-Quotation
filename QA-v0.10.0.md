# v0.10.0 QA

| 항목 | 결과 | 확인 범위 |
| --- | --- | --- |
| Source |991개/17suite 통과| 36장비,12스킬121검사, 능력치 미리보기/실착용148검사, 전신 보행32, 핍22, 보스39+실제 충돌28, 이야기77, 언어/외형100 등 |
| Windows / Wine |23개 통과| 실제 실행 파일 입력, 전투, 구역02, 드롭/장비 착용, 패배, 새 프로세스의 별빛 저장 복원. 엔진 오류 없음 |
| Linux |23개 통과| 같은 실제 입력·전투·이동·장비·저장 복원. 엔진 오류 없음 |
| Web |48개 통과| 기본 플레이15, 기본 오프닝10, 한국어/영어 전환·저장15, 실제 Q/우클릭8. HTTP/JS/엔진 오류 없음 |
| Mac package |통과| 0.10.0메타데이터·arm64·실행권한·PCK·9리소스 해시·89,490서명 코드 페이지. 실기 실행/Apple 공증 미검증 |
| Native icons |3개 통과| 실제 Windows PE의6크기 아이콘이 제작ICO와 일치하며 기본 엔진 아이콘이 없음. Mac 번들의ICNS와 설정도 일치 |
| Visual review |소스 장면과 실행 캡처 검토| 연결된 전신6걸음, 꼬리 숨김, 같은 인간 핍, 한/영 장비 비교창,36아이콘/착용, 둥근 화염구, 새 보스와 파괴/재생 |
| Performance |4조건 순차 측정| 같은 경고 장면158.87→159.10평균drawcalls. p95/p99프레임 시간은 증가해 전반적인 속도 향상을 단정하지 않음. 추가 페이지/파편 장면도 기록 |
| Delivery |packaging| ZIP/실행payload/권한 일치를 검사하고, 게시 후 다섯 ZIP·체크섬의 새 다운로드 결과를 공개 QA에 추가 |

빌드 때17suite957검사가 통과했고, 이후 능력치 검사114개를148개로 확장해 다시 통과했습니다. 중복114개를 제외한 최종 검사 수는991개입니다. 확장분은8구역의 한글/영문 제목 실제 글자 폭·헤더 경계와 장비 패널의 화면 경계를 확인합니다. 게임/이야기 변경은 최종 빌드에 포함되며 이후 수정은 검사와 문서에 한정됩니다.

[소스 로그](qa/v0100-source-tests.txt), [능력치148검사](qa/v0100-character-stats.txt), [Windows](qa/v0100-windows-tests.txt), [Linux](qa/v0100-linux-tests.txt), [웹](qa/v0100-web-tests.txt), [오프닝](qa/v0100-story-web-tests.txt), [언어](qa/v0100-localized-web-tests.txt), [Q/우클릭](qa/v0100-item-skills-web-tests.txt), [Mac](qa/v0100-macos-package.txt), [아이콘](qa/v0100-platform-icons.txt), [측정 방법과 원시 수치](qa/v0100-performance/METHOD.md).

원정8구역·최종 보스·결말은 소스 통합 검사 범위입니다. 실행 파일의 실제 입력 검사는 튜토리얼과 구역02·저장 복원까지이며, 자연스러운 전체 캠페인 완주나 Mac 실기 실행을 뜻하지 않습니다. 시각 확인용 장면은 생산 코드에 시험 상태를 설정한 장면이며 검증 범위를 구분합니다.

장비창 개편으로 GUI 검사기의 예전 영역/문구와OCR 단어 분리가 맞지 않았습니다. 실제 버튼을 재확인하고, 같은 줄의 Eq+uip 단어를 합쳐 위치를 읽도록 검사기를 수정했습니다. 좌표를 고정해 착용 성공을 가정하지 않으며 실제 착용 피드백을 확인합니다. 웹 검사는 새 장착칸·능력치·초기 지팡이 문구를 읽습니다.

시각 증거: [걷기](qa/v0100-walk-03.png), [능력치 한글](qa/v0100-inventory-compare-ko.png), [능력치 영어](qa/v0100-inventory-compare-en.png), [필드 핍](qa/v0100-pip-world.png), [상점 핍](qa/v0100-pip-shop-ko.png), [귀여운 장비](qa/v0100-cute-equipment.png), [화염구](qa/v0100-fireball-headings.png), [장벽](qa/v0100-boss-shield.png), [파괴](qa/v0100-boss-break.png), [빈틈](qa/v0100-boss-exposed.png), [재생](qa/v0100-boss-reforming.png).
