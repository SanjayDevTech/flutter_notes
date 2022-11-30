import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:flutter_notes/data/models.dart';
import 'package:flutter_notes/data/store.dart';

import 'repository.dart';
import 'body.dart';
import 'provider.dart';
import 'state.dart';

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
        title: Text(noteId == null ? 'Add Page' : 'Edit Page'),
      ),
      body: ViewPageProvider(
        state: ViewPageState(repository, noteId: noteId),
        child: ViewPageBody(),
      ),
    );
  }
}
