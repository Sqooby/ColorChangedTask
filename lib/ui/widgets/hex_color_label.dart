import 'package:flutter/material.dart';

class HexColorLabel extends StatelessWidget {
  const HexColorLabel({
    required this.hex,
    required this.textColor,
    super.key,
  });

  final String hex;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      hex,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
      textAlign: TextAlign.center,
    );
  }
}
