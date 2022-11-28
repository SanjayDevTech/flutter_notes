import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/home/repository.dart';

import 'state.dart';

class HomePageProvider extends InheritedWidget {
  const HomePageProvider({super.key, required super.child, required this.state});
  
  final HomePageState state;

  static HomePageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomePageProvider>();
  }

  @override
  bool updateShouldNotify(HomePageProvider oldWidget) {
    return true;
  }
}