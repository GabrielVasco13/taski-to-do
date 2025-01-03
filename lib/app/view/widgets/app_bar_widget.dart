import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  const AppBarWidget({
    super.key,
  }) : super(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: const SizedBox(),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Image.asset('assets/icon.png'),
      ),
      titleSpacing: 6,
      title: const Text('Taski'),
      actions: [
        const Text('John'),
        const SizedBox(width: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset('assets/images/picture.png'),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
