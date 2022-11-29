import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_state/simple_state.dart';

import 'provider.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final state = HomePageProvider.of(context)!.state;

    final repository = state.repository;

    final notesObservable = repository.watchNotes();

    return Observer(
      listenables: [notesObservable],
      builder: (_) {
        final notes = notesObservable.value;
        if (notes.isEmpty) {
          return const Center(child: Text('No notes'));
        }
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(note.title),
              subtitle: Text(
                note.body,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => repository.deleteNoteById(note.key),
              ),
              onTap: () {
                context.push('/view/${note.key}');
              },
            );
          },
        );
      },
    );
  }
}
