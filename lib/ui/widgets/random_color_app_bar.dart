import 'package:flutter/material.dart';

import '../../strings/ui_strings.dart';

class RandomColorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RandomColorAppBar({
    required this.foregroundColor,
    super.key,
  });

  final Color foregroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(UiStrings.appName),
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: foregroundColor,
    );
  }
}
