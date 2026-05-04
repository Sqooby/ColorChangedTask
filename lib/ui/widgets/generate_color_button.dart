import 'package:flutter/material.dart';

import '../../strings/ui_strings.dart';
import '../keys/color_screen_keys.dart';
import '../layout/color_screen_layout.dart';

class GenerateColorButton extends StatelessWidget {
  const GenerateColorButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    super.key,
  });

  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ColorScreenLayout.generateButtonWidth,
      child: ElevatedButton(
        key: ColorScreenKeys.generateButton,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: const Text(UiStrings.generateColor),
      ),
    );
  }
}
