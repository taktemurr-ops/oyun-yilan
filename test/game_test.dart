import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yilan/oyun_yilan.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yilanConfig.title.length, 33);
    expect(yilanConfig.tagline.length, 33);
    for (final s in yilanConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yilanRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yilanId, optionalMechanics: yilanRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yilanRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
