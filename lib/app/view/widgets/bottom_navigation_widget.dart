import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:taski_to_do/app/app_widget.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  final List<String> _routes = [
    routePaths.view.toDo,
    routePaths.view.create,
    routePaths.view.search,
    routePaths.view.done,
  ];

  int _getIndexFromRoute(String route) {
    return _routes.indexOf(route);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = _getIndexFromRoute(Routefly.currentOriginalPath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentRoute = Routefly.currentOriginalPath;
    final newIndex = _getIndexFromRoute(currentRoute);
    if (newIndex != -1 && newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Todo',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Create',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.done),
      label: 'Done',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    Routefly.navigate(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: _items,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }
}
