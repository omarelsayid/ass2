import 'package:ass2/core/services/data_base_services.dart';
import 'package:ass2/data/models/notes_model.dart';
import 'package:ass2/data/repos/notes_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotesRepo)
class NotesRepoImp implements NotesRepo {
  final DataBaseService _dataBaseService;

  NotesRepoImp({required DataBaseService dataBaseService})
      : _dataBaseService = dataBaseService;

  @override
  Future<int> addNote(NotesModel note) async {
    return await _dataBaseService.insertNote(note);
  }

  @override
  Future<List<NotesModel>> getAllNotes() async {
    return await _dataBaseService.getAllNotes();
  }

  @override
  Future<int> updateNote(NotesModel note) async {
    return await _dataBaseService.updateNote(note);
  }

  @override
  Future<int> deleteNote(int id) async {
    return await _dataBaseService.deleteNote(id);
  }
}
