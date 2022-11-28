import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("View Screen"),
        onPressed: () {
          context.push("/view/5");
        },
      ),
    );
  }
}
