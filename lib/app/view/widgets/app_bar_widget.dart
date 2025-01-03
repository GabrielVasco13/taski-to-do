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
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Image.asset('assets/icon.png'),
      ),
      titleSpacing: 6,
      title: const Text('Taski'),
      actions: [
        const Text(
          'John',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(
            'assets/images/picture.png',
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
