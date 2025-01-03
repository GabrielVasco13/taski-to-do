import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'app_widget.route.dart';
part 'app_widget.g.dart';

@Main('lib/app')
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
      ),
    );
  }
}
