import 'package:flutter/material.dart';
import 'package:flutter_notes/data/store.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/home/main.dart';
import 'screens/view/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initHiveBox();
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
      builder: (context, state) {
        String id = state.params['id']!;
        return ViewPage(
          noteId: int.tryParse(id),
        );
      },
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
