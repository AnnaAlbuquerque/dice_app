import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;
  const GradientContainer({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 2, 36, 65),
            Color.fromARGB(255, 3, 63, 112),
          ],
        ),
      ),
      child: child,
    );
  }
}
