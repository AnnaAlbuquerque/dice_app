import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  const StyledText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
