import 'package:flutter_notes/data/models.dart';
import 'package:flutter_notes/data/store.dart';
import 'package:simple_state/simple_state.dart';

class HomePageRepository {

  final NotesStore _notesStore;

  HomePageRepository(this._notesStore);

  Observable<List<Note>> watchNotes() {
    return _notesStore.notes;
  }

  Future<void> deleteNoteById(int id) async {
    await _notesStore.deleteNoteById(id);
  }

  Future<void> addNote(Note note) async {
    await _notesStore.addNote(note);
  }


}