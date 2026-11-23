import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_avi/oyun_kelime_avi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeAviConfig.title.length, 33);
    expect(kelimeAviConfig.tagline.length, 33);
    for (final s in kelimeAviConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeAviConfig.gameId, kelimeAviId);
    expect(kelimeAviRules.gameId, kelimeAviId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeAviRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeAviId, optionalMechanics: kelimeAviRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeAviRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeAviRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
