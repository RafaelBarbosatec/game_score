import 'package:bonfire/bonfire.dart';
import 'package:game_score/game_spritesheet.dart';
import 'package:game_score/kelvin.dart';

class Coin extends GameDecoration with Sensor {
  Coin(Vector2 position)
      : super.withAnimation(
          animation: GameSpriteSheet.coin,
          size: Vector2.all(16),
          position: position,
        );

  @override
  void onContact(GameComponent component) {
    if (component is Kelvin) {
      component.incrementScore();
      removeFromParent();
    }
  }
}
