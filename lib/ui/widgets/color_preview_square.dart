import 'package:flutter/material.dart';

import '../layout/color_screen_layout.dart';

class ColorPreviewSquare extends StatelessWidget {
  const ColorPreviewSquare({
    required this.fillColor,
    required this.borderColor,
    super.key,
  });

  final Color fillColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ColorScreenLayout.previewSize,
      height: ColorScreenLayout.previewSize,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(ColorScreenLayout.previewBorderRadius),
        border: Border.all(
          color: borderColor.withValues(
            alpha: borderColor.a * ColorScreenLayout.previewBorderOpacity,
          ),
          width: ColorScreenLayout.previewBorderWidth,
        ),
      ),
    );
  }
}
