import 'package:ass2/data/models/notes_model.dart';

sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<NotesModel> notes;
  NotesLoaded(this.notes);
}

class NotesError extends NotesState {
  final String message;
  NotesError(this.message);
}
