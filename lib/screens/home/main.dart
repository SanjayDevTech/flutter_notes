import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/home/provider.dart';

import 'body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const HomePageProvider(child: HomePageBody()),
    );
  }
}