import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_state/simple_state.dart';

import 'models.dart';

abstract class NotesStore {
  Observable<List<Note>> get notes;
  List<Note> getNotes();
  Future<Note?> getNoteById(int id);
  Future<void> addNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNoteById(int id);
}

Future<void> initHiveBox() async {
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>("notes");
}

class NotesStoreImpl implements NotesStore {

  final Box<Note> _notesBox;

  NotesStoreImpl(this._notesBox);

  // final _notesStreamController = StreamController<List<Note>>.broadcast();

  bool _isNotesStreamInitialized = false;

  final _notesObserver = Observable(<Note>[]);

  @override
  Observable<List<Note>> get notes {
    if (!_isNotesStreamInitialized) {
      _isNotesStreamInitialized = true;
      _notesObserver.value = getNotes();
      _notesBox.watch().listen((event) {
        _notesObserver.value = getNotes();
      });
    }
    return _notesObserver;
  }

  @override
  Future<void> addNote(Note note) async {
    await _notesBox.add(note);
  }

  @override
  Future<void> deleteNoteById(int id) async {
    await _notesBox.delete(id);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return _notesBox.get(id);
  }

  @override
  List<Note> getNotes() {
    return _notesBox.values.toList();
  }

  @override
  Future<void> updateNote(Note note) async {
    await _notesBox.put(note.key, note);
  }

}