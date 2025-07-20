
import 'package:ass2/data/models/notes_model.dart';

abstract class NotesRepo {
  Future<int> addNote(NotesModel note);
  Future<List<NotesModel>> getAllNotes(); // Ordered by date (DESC)
  Future<int> updateNote(NotesModel note);
  Future<int> deleteNote(int id);

}
