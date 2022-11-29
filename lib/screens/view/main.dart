import 'package:flutter/material.dart';
import 'package:flutter_notes/data/models.dart';
import 'package:flutter_notes/data/store.dart';
import 'package:flutter_notes/screens/view/body.dart';
import 'package:flutter_notes/screens/view/provider.dart';
import 'package:flutter_notes/screens/view/state.dart';
import 'package:hive/hive.dart';

import 'repository.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, this.noteId});

  final int? noteId;

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<Note>("notes");
    final NotesStore store = NotesStoreImpl(notesBox);
    final repository = ViewPageRepository(store);
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Page'),
      ),
      body: ViewPageProvider(
        state: ViewPageState(repository, noteId: noteId),
        child: ViewPageBody(),
      ),
    );
  }
}
