import 'package:flutter/material.dart';

class HomePageProvider extends InheritedWidget {
  const HomePageProvider({super.key, required super.child});

  static HomePageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomePageProvider>();
  }

  @override
  bool updateShouldNotify(HomePageProvider oldWidget) {
    return true;
  }
}