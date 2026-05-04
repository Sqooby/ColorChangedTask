import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color/color_generator.dart';
import 'strings/ui_strings.dart';
import 'ui/color_screen.dart';
import 'ui/state/color_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UiStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ColorController(
          generator: RandomColorGenerator(),
        ),
        child: const ColorScreen(),
      ),
    );
  }
}
