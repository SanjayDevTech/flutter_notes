import 'package:flutter/material.dart';

import 'state.dart';

class ViewPageProvider extends InheritedWidget {
  const ViewPageProvider({super.key, required super.child, required this.state});

  final ViewPageState state;

  static ViewPageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewPageProvider>();
  }

  @override
  bool updateShouldNotify(ViewPageProvider oldWidget) {
    return true;
  }
}