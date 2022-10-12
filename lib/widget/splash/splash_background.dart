// Flutter imports:
import 'package:flutter/material.dart';

import '../../modules/theme.dart';

class SplashBackground extends StatelessWidget {
  final Widget child;

  const SplashBackground({
    Key? key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0, 1],
          colors: [
            Color(0xff7455F7),
            Color(0xff8F38FF),
          ],
        ),
      ),
      child: child,
    );
  }
}
