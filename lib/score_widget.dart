import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_score/score_controller.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({Key? key}) : super(key: key);

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  late ScoreController scoreController;

  @override
  void initState() {
    scoreController = BonfireInjector.instance.get();
    scoreController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    scoreController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('SCORE: ${scoreController.score}'),
        ),
      ),
    );
  }

  void _listener() {
    setState(() {});
  }
}
