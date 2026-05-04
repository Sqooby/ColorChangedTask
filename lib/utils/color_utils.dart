import 'package:flutter/material.dart';

String colorToHexRgb(Color color) {
  final r = color.red.toRadixString(16).padLeft(2, '0');
  final g = color.green.toRadixString(16).padLeft(2, '0');
  final b = color.blue.toRadixString(16).padLeft(2, '0');
  return '#${(r + g + b).toUpperCase()}';
}

/// Returns black or white for readable text on [background].
Color readableTextColor(Color background) {
  return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
