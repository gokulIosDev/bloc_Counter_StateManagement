import 'package:bloc_sample_project/models/noteModel.dart';

abstract class NotesState{}

class NotesInitialState extends NotesState {}

class NotesLoadingStale extends NotesState {}

class NotesLoadedState extends NotesState{
   List <NoteModels> noteModel;
  NotesLoadedState({required this.noteModel});
}

class NotesErrorState extends NotesState{
  String error;
  NotesErrorState({required this.error});
}