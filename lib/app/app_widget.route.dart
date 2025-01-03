// GENERATED FILE. PLEASE DO NOT EDIT THIS FILE!!

import 'package:flutter/widgets.dart';
import 'package:routefly/routefly.dart';

import 'view/create/create_page.dart' as a1;
import 'view/done/done_page.dart' as a2;
import 'view/search/search_page.dart' as a0;
import 'view/to_do/to_do_page.dart' as a3;

Route b0Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.SearchPage(),
    );
Route b1Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.CreatePage(),
    );
Route b2Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.DonePage(),
    );
Route b3Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.ToDoPage(),
    );
