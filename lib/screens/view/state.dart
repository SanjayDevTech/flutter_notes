import 'repository.dart';

class ViewPageState {
  final int? noteId;
  final ViewPageRepository repository;

  ViewPageState(this.repository, {this.noteId});
}