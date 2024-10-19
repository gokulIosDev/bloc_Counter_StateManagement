import 'package:bloc_sample_project/models/noteModel.dart';

abstract class NotesEvents {}

class AddNotesEvents extends NotesEvents {
  NoteModels newNote;

  AddNotesEvents({required this.newNote});
}

class FetchNotesEvents extends NotesEvents {}

class UpdateNotesEvents extends NotesEvents {
  int id;
  String title;
  String desc;

  UpdateNotesEvents(
      {required this.id, required this.title, required this.desc});
}

class DeleteNotesEvents extends NotesEvents {
  int id;

  DeleteNotesEvents({required this.id});
}
