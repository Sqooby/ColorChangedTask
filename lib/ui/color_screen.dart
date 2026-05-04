import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/color_controller.dart';
import 'widgets/random_color_app_bar.dart';
import 'widgets/random_color_body.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ColorController>();

    final textColor = controller.textColor;
    final topPadding = MediaQuery.of(context).padding.top + kToolbarHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RandomColorAppBar(foregroundColor: textColor),
      body: RandomColorBody(
        backgroundColor: controller.color,
        textColor: textColor,
        hex: controller.hex,
        topPadding: topPadding,
        onGenerate: controller.generateNext,
      ),
    );
  }
}
