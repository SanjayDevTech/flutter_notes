import 'package:flutter_notes/data/store.dart';
import 'package:flutter_notes/screens/view/repository.dart';

class ViewPageState {
  final String? noteId;
  final ViewPageRepository repository;

  ViewPageState(this.repository, {this.noteId});
}