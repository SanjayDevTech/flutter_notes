import 'package:flutter/material.dart';
import 'package:flutter_notes/utils.dart';

import 'provider.dart';

class ViewPageBody extends StatelessWidget {
  const ViewPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final state = ViewPageProvider.of(context)!.state;

    final noteId = state.noteId;

    final repository = state.repository;

    if (noteId == null) {
      return const Center(child: Text('No note selected'));
    }

    return repository.getNoteById(noteId).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error.toString())),
          data: (note) {
            if (note == null) {
              return const Center(child: Text('Note not found'));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    note.body,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        );
  }
}
