import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_score/coin.dart';
import 'package:game_score/kelvin.dart';
import 'package:game_score/score_controller.dart';
import 'package:game_score/score_widget.dart';

void main() {
  BonfireInjector.instance.put((i) => ScoreController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'map.tmj',
        objectsBuilder: {
          'coin': (prop) => Coin(prop.position),
        },
      ),
      joystick: Joystick(directional: JoystickDirectional()),
      player: Kelvin(position: Vector2(50, 50)),
      overlayBuilderMap: {
        'score': (context, game) => const ScoreWidget(),
      },
      initialActiveOverlays: const [
        'score',
      ],
    );
  }
}
