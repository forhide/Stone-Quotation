# 그래픽 파일 지도

01~04를 복원하면 현재 실행용 아트가 모두 갖춰집니다. 현재 PNG·SVG·폰트·효과음과 `.import`는 원본 바이트 그대로 들어 있습니다. 아틀라스 잘라 쓰기는 `scripts/presentation/`와 `scripts/player/`가 담당합니다.

| 묶음 | 포함 범위 |
| --- | --- |
| Meowgnificent-v0.16.0-02-art-characters.zip | 고양이·NPC·적·보스 |
| Meowgnificent-v0.16.0-03-art-world-story.zip | 배경·이야기·소품 |
| Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip | 장비·FX·UI·폰트·효과음 |

## HD 리소스와 선택 원본 PNG

`.res`는 Godot에서 읽는 실제 텍스처 소스이며 `.godot/` 가져오기 캐시와 다릅니다. 아래 PNG는 과거의 변환 전 그림입니다. 크기·아틀라스 좌표·알파·팔레트를 확인한 뒤 실제 리소스 생성/연결까지 수정해야 게임에 반영됩니다. 자동 교체하지 마세요.

| 현재 실행 파일 | 현재 크기 | 05의 참고 PNG | 참고 크기 |
| --- | --- | --- | --- |
| `art/hd/pastel_meme_actions.res` | 3072×2048 | `art/characters/pastel_meme_actions.png` | 1536×1024 |
| `art/hd/animal_cast.res` | 3072×2048 | `art/npc/animal_cast.png` | 1536×1024 |
| `art/hd/perfect_grimoire.res` | 2508×2508 | `art/grimoire/perfect_grimoire.png` | 1254×1254 |
| `art/hd/hd_academy_library.res` | 3840×2560 | `art/environments/hd_academy_library.png` | 1536×1024 |
| `art/hd/hd_basement_storeroom.res` | 3840×2560 | `art/environments/hd_basement_storeroom.png` | 1536×1024 |
| `art/hd/hd_forbidden_garden.res` | 3840×2560 | `art/environments/hd_forbidden_garden.png` | 1536×1024 |
| `art/hd/hd_grand_archive.res` | 3840×2560 | `art/environments/hd_grand_archive.png` | 1536×1024 |

새 장비 48점은 `art/equipment/journey_weapons.png`, `journey_trinkets.png`에 있습니다. 고양이 보행은 `art/characters/meme_walk.png`와 `scripts/player/grounded_gait.gd`를 확인하세요. 폰트·엔진 라이선스는 `docs/`와 `art/fonts/`에 보존했습니다. 생성 아트 출처는 `docs/ART_REFERENCE.md`와 각 아트 폴더 README에 있습니다.

## 현재 아트 전체 목록

- `art/audio/README.md` · 833 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_fire.wav` · 11,068 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_fire.wav.import` · 495 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_ice.wav` · 14,156 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_ice.wav.import` · 492 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_leaf.wav` · 14,596 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_leaf.wav.import` · 495 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_lightning.wav` · 7,982 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_lightning.wav.import` · 510 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_metal.wav` · 14,156 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_metal.wav.import` · 498 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_stone.wav` · 10,188 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_stone.wav.import` · 498 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_water.wav` · 12,832 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_water.wav.import` · 498 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_wind.wav` · 12,392 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/cast_wind.wav.import` · 495 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/clear.wav` · 22,094 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/clear.wav.import` · 483 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/equip.wav` · 10,188 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/equip.wav.import` · 483 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/gear.wav` · 16,802 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/gear.wav.import` · 480 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/hit.wav` · 7,100 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/hit.wav.import` · 477 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/hurt.wav` · 12,392 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/hurt.wav.import` · 479 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/miscast.wav` · 16,802 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/miscast.wav.import` · 488 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/pickup.wav` · 9,746 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/pickup.wav.import` · 485 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/skill.wav` · 19,448 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/audio/skill.wav.import` · 483 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/characters/STORYBOOK-ART.md` · 2,636 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/characters/WALK-v0.10.0.md` · 521 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/characters/meme_walk.png` · 2,485,047 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/characters/meme_walk.png.import` · 945 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/LIVING-REAGENTS.md` · 1,002 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/README.md` · 734 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/living_reagents.png` · 809,872 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/living_reagents.png.import` · 960 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/perfect_examiner-ART.md` · 1,282 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/perfect_examiner.svg` · 2,502 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/perfect_examiner.svg.import` · 1,060 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/storybook_familiars.png` · 1,301,640 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/enemies/storybook_familiars.png.import` · 972 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/environments/README.md` · 2,025 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/environments/storybook_world_details.png` · 2,354,357 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/environments/storybook_world_details.png.import` · 988 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/equipment/README.md` · 3,671 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/cute_charms.png` · 1,403,543 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/cute_charms.png.import` · 949 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/cute_equipment.png` · 1,351,745 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/cute_equipment.png.import` · 959 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/cute_pendants.png` · 1,318,434 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/cute_pendants.png.import` · 956 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/elemental_weapons.png` · 987,043 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/elemental_weapons.png.import` · 967 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/journey_trinkets.png` · 2,550,638 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/journey_trinkets.png.import` · 965 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/journey_weapons.png` · 2,367,667 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/journey_weapons.png.import` · 962 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/silverthorn_wand.png` · 603,921 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/equipment/silverthorn_wand.png.import` · 964 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fonts/OFL.txt` · 4,463 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fonts/PRETENDARD-LICENSE.txt` · 4,419 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fonts/Pretendard-Medium.otf` · 1,584,068 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fonts/Pretendard-Medium.otf.import` · 786 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fx/README.md` · 1,314 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fx/cute_fireball.png` · 665,885 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fx/cute_fireball.png.import` · 949 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fx/fireball-ART.md` · 1,996 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fx/storybook_spell_fx.png` · 1,678,392 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/fx/storybook_spell_fx.png.import` · 964 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/grimoire/README.md` · 975 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/hd/animal_cast.res` · 2,064,938 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/hd/hd_academy_library.res` · 1,010,398 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/hd/hd_basement_storeroom.res` · 845,994 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/hd/hd_forbidden_garden.res` · 1,109,646 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/hd/hd_grand_archive.res` · 1,228,050 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/hd/pastel_meme_actions.res` · 1,403,174 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/hd/perfect_grimoire.res` · 2,089,798 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/items/README.md` · 944 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/archive_gate_closed.svg` · 1,520 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/archive_gate_closed.svg.import` · 1,067 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/archive_gate_open.svg` · 1,471 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/archive_gate_open.svg.import` · 1,061 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/archive_route.svg` · 552 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/archive_route.svg.import` · 1,049 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_charm.svg` · 682 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_charm.svg.import` · 1,039 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_collar.svg` · 686 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_collar.svg.import` · 1,043 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_food.svg` · 751 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_food.svg.import` · 1,036 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_gold.svg` · 742 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_gold.svg.import` · 1,036 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_wand.svg` · 704 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/drop_wand.svg.import` · 1,037 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/floor_fire.svg` · 2,000 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/items/floor_fire.svg.import` · 1,039 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/npc/ANIMAL-CAST.md` · 1,089 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/npc/PICNIC-MARKET.md` · 939 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/npc/PIP-ART.md` · 985 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/npc/picnic_market.png` · 2,059,958 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/npc/picnic_market.png.import` · 950 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/npc/story_tea.png` · 1,771,308 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/npc/story_tea.png.import` · 938 bytes · Meowgnificent-v0.16.0-02-art-characters.zip
- `art/story/README.md` · 1,054 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/README.md` · 887 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/exam_aftermath.png` · 2,850,160 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/exam_aftermath.png.import` · 962 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/exam_sooty_cast.png` · 1,907,729 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/exam_sooty_cast.png.import` · 964 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/practice_target.png` · 2,064,292 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/story/props/practice_target.png.import` · 964 bytes · Meowgnificent-v0.16.0-03-art-world-story.zip
- `art/ui/ICON-ART.md` · 398 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/ui/app_icon.icns` · 2,857,809 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/ui/app_icon.ico` · 186,929 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/ui/app_icon.png` · 2,152,599 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/ui/app_icon.png.import` · 935 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
- `art/ui/storybook_theme.tres` · 177 bytes · Meowgnificent-v0.16.0-04-art-equipment-fx-ui.zip
