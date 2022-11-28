import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home/main.dart';
import 'screens/view/main.dart';

void main() {
  runApp(const FlutterNotesApp());
}

final _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/view/:id',
      builder: (context, state) => ViewPage(
        noteId: state.params["id"],
      ),
    )
  ],
);

class FlutterNotesApp extends StatelessWidget {
  const FlutterNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Notes",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
