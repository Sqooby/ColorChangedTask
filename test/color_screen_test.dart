import 'dart:collection';

import 'package:changedcolortask/color/color_generator.dart';
import 'package:changedcolortask/ui/color_screen.dart';
import 'package:changedcolortask/ui/keys/color_screen_keys.dart';
import 'package:changedcolortask/ui/state/color_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

class _SequenceColorGenerator implements ColorGenerator {
  _SequenceColorGenerator(Queue<Color> colors) : _colors = colors;

  final Queue<Color> _colors;

  @override
  Color generate() => _colors.removeFirst();
}

void main() {
  testWidgets('Generate button updates the displayed hex color', (tester) async {
    final colors = Queue<Color>.from(<Color>[
      const Color.fromARGB(255, 1, 2, 3),
      const Color.fromARGB(255, 255, 0, 16),
    ]);

    await tester.pumpWidget(
      ChangeNotifierProvider<ColorController>(
        create: (_) => ColorController(
          generator: _SequenceColorGenerator(colors),
        ),
        child: const MaterialApp(
          home: ColorScreen(),
        ),
      ),
    );

    expect(find.text('#010203'), findsOneWidget);

    await tester.tap(find.byKey(ColorScreenKeys.generateButton));
    await tester.pump();

    expect(find.text('#FF0010'), findsOneWidget);
  });
}
