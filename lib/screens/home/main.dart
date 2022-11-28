import 'package:flutter/material.dart';
import 'package:flutter_notes/data/models.dart';
import 'package:flutter_notes/data/store.dart';
import 'package:flutter_notes/screens/home/provider.dart';
import 'package:flutter_notes/screens/home/repository.dart';
import 'package:flutter_notes/screens/home/state.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<Note>("notes");
    final NotesStore store = NotesStoreImpl(notesBox);
    final HomePageRepository repository = HomePageRepository(store);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: HomePageProvider(
        state: HomePageState(repository),
        child: const HomePageBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          repository.addNote(Note(
            id: (const Uuid()).v4(),
            title: 'New Note',
            body: 'New Note Body',
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
