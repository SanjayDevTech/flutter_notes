import 'package:flutter/material.dart';
import 'package:flutter_notes/data/models.dart';

import 'package:flutter_notes/utils.dart';

import 'provider.dart';

class ViewPageBody extends StatelessWidget {
  ViewPageBody({super.key});

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ViewPageProvider.of(context)!.state;

    final noteId = state.noteId;

    final repository = state.repository;

    final noteFuture = repository.getNoteById(noteId);

    return noteFuture.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error) => Center(child: Text(error.toString())),
      data: (note) {
        _titleController.text = note?.title ?? "";
        _bodyController.text = note?.body ?? "";
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: TextField(
                  controller: _titleController,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Notes title',
                    hintText: 'Enter the notes title',
                  ),
                ),
              ),
              Flexible(
                flex: 0,
                child: SingleChildScrollView(
                  child: TextField(
                    controller: _bodyController,
                    style: const TextStyle(fontSize: 18),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Notes content',
                      hintText: 'Enter the notes content',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final newTitle = _titleController.text;
                  final newBody = _bodyController.text;

                  final navigator = Navigator.of(context);

                  if (newTitle.isEmpty || newBody.isEmpty) {
                    return;
                  }

                  if (note != null) {
                    if (note.title == newTitle && note.body == newBody) {
                      Navigator.of(context).pop();
                      return;
                    }
                    final updatedNote = note
                      ..body = newBody
                      ..title = newTitle;

                    await repository.updateNote(updatedNote);
                  } else {
                    final newNote = Note(
                      title: newTitle,
                      body: newBody,
                    );
                    await repository.addNote(newNote);
                  }
                  navigator.pop();
                },
                child: Text(note == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}
