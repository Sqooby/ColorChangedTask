import 'dart:collection';
import 'dart:math';

import 'package:changedcolortask/color/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class _FixedRandom implements Random {
  _FixedRandom(this.values);

  final Queue<int> values;

  @override
  int nextInt(int max) {
    final value = values.removeFirst();
    if (value < 0 || value >= max) {
      throw ArgumentError.value(value, 'value', 'Must be in range [0, $max).');
    }
    return value;
  }

  @override
  bool nextBool() => nextInt(2) == 1;

  @override
  double nextDouble() {
    return nextInt(1 << 20) / (1 << 20);
  }
}

void main() {
  test('RandomColorGenerator generates opaque RGB colors', () {
    final generator = RandomColorGenerator(
      random: _FixedRandom(Queue<int>.from([1, 2, 3])),
    );

    final color = generator.generate();

    expect(color.alpha, 255);
    expect(color.red, 1);
    expect(color.green, 2);
    expect(color.blue, 3);
  });

  test('RandomColorGenerator generates different colors for subsequent calls', () {
    final generator = RandomColorGenerator(
      random: _FixedRandom(Queue<int>.from([0, 0, 0, 255, 255, 255])),
    );

    final first = generator.generate();
    final second = generator.generate();

    expect(first, const Color.fromARGB(255, 0, 0, 0));
    expect(second, const Color.fromARGB(255, 255, 255, 255));
  });
}
