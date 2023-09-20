import 'dart:math';

import 'package:dice_app/widgets/gradient_container.dart';
import 'package:dice_app/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin {
  late int _activeDiceValue;
  late AnimationController _animationController;
  late Animation<int> _animation;
  final Random _rand = Random();

  @override
  void initState() {
    _activeDiceValue = 1;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = IntTween(begin: 1, end: 6).animate(_animationController)
      ..addListener(() {
        setState(() {
          _activeDiceValue = _animation.value;
        });
      });
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _rollDice() async {
    _animationController.reset();
    await _animationController.forward();
    setState(() {
      _activeDiceValue = _rand.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/dice-$_activeDiceValue.png",
              width: 200,
            ),
            const SizedBox(
              height: 80,
            ),
            TextButton(
              onPressed: _rollDice,
              child: const StyledText(
                text: "Roll Dice",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
