import 'package:flutter/material.dart';

import '../../color/color_generator.dart';
import '../../utils/color_utils.dart';

class ColorController extends ChangeNotifier {
  ColorController({required ColorGenerator generator}) : _generator = generator {
    _color = _generator.generate();
  }

  final ColorGenerator _generator;
  late Color _color;

  Color get color => _color;

  String get hex => colorToHexRgb(_color);

  Color get textColor => readableTextColor(_color);

  void generateNext() {
    _color = _generator.generate();
    notifyListeners();
  }
}
