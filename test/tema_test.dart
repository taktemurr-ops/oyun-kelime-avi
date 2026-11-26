import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_avi/oyun_kelime_avi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('Tema Avı: 33 dilde ad ve anlatım', () {
    expect(temaAviConfig.title.length, 33);
    expect(temaAviConfig.tagline.length, 33);
    for (final s in temaAviConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(temaAviRules.gameId, temaAviId);
    expect(temaAviRules.levelCount, 100000);
  });

  test('Tema Avı: bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    final planner = LevelPlanner(gameId: temaAviId, optionalMechanics: temaAviRules.optionalMechanics);
    for (final l in ['tr', 'en', 'ar', 'ja', 'zh', 'hi']) {
      temaAviRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(temaAviRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
