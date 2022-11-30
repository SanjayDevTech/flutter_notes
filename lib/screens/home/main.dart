import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import 'package:flutter_notes/data/models.dart';
import 'package:flutter_notes/data/store.dart';

import 'body.dart';
import 'provider.dart';
import 'repository.dart';
import 'state.dart';

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
        onPressed: () {
          context.push('/view');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
