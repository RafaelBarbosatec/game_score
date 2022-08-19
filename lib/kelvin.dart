import 'package:bonfire/bonfire.dart';
import 'package:game_score/game_spritesheet.dart';
import 'package:game_score/score_controller.dart';

class Kelvin extends SimplePlayer with ObjectCollision {
  late ScoreController scoreController;

  Kelvin({
    required super.position,
  }) : super(
          size: Vector2.all(32),
          speed: 80,
          animation: SimpleDirectionAnimation(
            idleRight: GameSpriteSheet.idleRight,
            runRight: GameSpriteSheet.runRight,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: size / 2.5,
            align: Vector2(size.x / 3, size.y / 2),
          ),
        ],
      ),
    );
  }

  @override
  void onMount() {
    scoreController = BonfireInjector.instance.get();
    super.onMount();
  }

  void incrementScore() {
    scoreController.increment();
  }
}
