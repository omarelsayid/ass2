import 'package:ass2/data/models/notes_model.dart';
import 'package:ass2/data/repos/notes_repo.dart';
import 'package:ass2/presentation/cubits/notes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotesCubit extends Cubit<NotesState> {
  final NotesRepo _notesRepo;

  NotesCubit(this._notesRepo) : super(NotesInitial());

  Future<void> fetchNotes() async {
    emit(NotesLoading());
    try {
      final notes = await _notesRepo.getAllNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError('Failed to load notes: $e'));
    }
  }

  Future<void> addNote(NotesModel note) async {
    try {
      await _notesRepo.addNote(note);
      await fetchNotes(); // Refresh notes after insert
    } catch (e) {
      emit(NotesError('Failed to add note: $e'));
    }
  }

  Future<void> updateNote(NotesModel note) async {
    try {
      await _notesRepo.updateNote(note);
      await fetchNotes(); // Refresh notes after update
    } catch (e) {
      emit(NotesError('Failed to update note: $e'));
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await _notesRepo.deleteNote(id);
      await fetchNotes(); // Refresh notes after delete
    } catch (e) {
      emit(NotesError('Failed to delete note: $e'));
    }
  }
}
