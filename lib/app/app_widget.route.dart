// GENERATED FILE. PLEASE DO NOT EDIT THIS FILE!!

import 'package:flutter/widgets.dart';
import 'package:routefly/routefly.dart';

import 'view/create/create_page.dart' as a2;
import 'view/search/search_page.dart' as a1;
import 'view/welcome/welcome_page.dart' as a0;

Route b0Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.WelcomePage(),
    );
Route b1Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.SearchPage(),
    );
Route b2Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.CreatePage(),
    );
