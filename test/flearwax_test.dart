import 'package:flearwax/flearwax.dart';
import 'package:test/test.dart';

void main() {
  group('GameContext tests', () {
    GameContext ctx;

    setUp(() {
      ctx = GameContext();
    });

    test('Test init', () {
      assert(ctx.levels is List<Level>);
      assert(ctx.levels.isEmpty);
    });
  });
}
