import 'package:flutter/material.dart';

import '../layout/color_screen_layout.dart';
import 'color_preview_square.dart';
import 'generate_color_button.dart';
import 'hex_color_label.dart';

class RandomColorBody extends StatelessWidget {
  const RandomColorBody({
    required this.backgroundColor,
    required this.textColor,
    required this.hex,
    required this.topPadding,
    required this.onGenerate,
    super.key,
  });

  final Color backgroundColor;
  final Color textColor;
  final String hex;
  final double topPadding;
  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: ColorScreenLayout.backgroundAnimation,
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.only(
        top: topPadding,
        left: ColorScreenLayout.contentPaddingHorizontal,
        right: ColorScreenLayout.contentPaddingHorizontal,
        bottom: ColorScreenLayout.contentPaddingBottom,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HexColorLabel(hex: hex, textColor: textColor),
            const SizedBox(height: ColorScreenLayout.hexToPreviewGap),
            ColorPreviewSquare(
              fillColor: backgroundColor,
              borderColor: textColor,
            ),
            const SizedBox(height: ColorScreenLayout.previewToButtonGap),
            GenerateColorButton(
              onPressed: onGenerate,
              backgroundColor: textColor,
              foregroundColor: backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
