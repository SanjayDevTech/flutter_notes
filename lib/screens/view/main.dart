import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/view/body.dart';
import 'package:flutter_notes/screens/view/provider.dart';
import 'package:flutter_notes/screens/view/state.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, this.noteId});

  final String? noteId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Page'),
      ),
      body: ViewPageProvider(
        state: ViewPageState(noteId: noteId),
        child: const ViewPageBody(),
      ),
    );
  }
}
