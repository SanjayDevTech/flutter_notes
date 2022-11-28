import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'provider.dart';

class ViewPageBody extends StatelessWidget {
  const ViewPageBody({super.key});

  @override
  Widget build(BuildContext context) {

    final String? noteId = ViewPageProvider.of(context)?.state.noteId;

    return Center(
      child: Column(
        children: [
          Text(noteId ?? "No note id"),
          ElevatedButton(
            child: const Text("Home Screen"),
            onPressed: () {
              context.push("/view/6");
            },
          ),
        ],
      ),
    );
  }
}