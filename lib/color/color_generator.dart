import 'dart:math';

import 'package:flutter/material.dart';

abstract interface class ColorGenerator {
  Color generate();
}

/// Generates random opaque RGB colors.
///
/// [random] is injectable for tests.
class RandomColorGenerator implements ColorGenerator {
  RandomColorGenerator({Random? random}) : _random = random ?? Random.secure();

  final Random _random;

  @override
  Color generate() {
    final r = _random.nextInt(256);
    final g = _random.nextInt(256);
    final b = _random.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }
}
