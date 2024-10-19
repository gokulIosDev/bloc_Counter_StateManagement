import 'package:bloc_sample_project/dataBase/dataHelper.dart';
import 'package:bloc_sample_project/repository/screens/blocs/noteEvents.dart';
import 'package:bloc_sample_project/repository/screens/blocs/notesStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Bloc<NotesEvents,NotesState>{
  DbHelper db_helper;
  NoteBloc({required this.db_helper}):super(NotesInitialState()){
    on<AddNotesEvents>((event,emit)async{
      emit(NotesLoadingStale());
      bool check = await db_helper.addNotes(event.newNote);
      var arrNotes = await db_helper.fetchNotes();
      emit(NotesLoadedState(noteModel: arrNotes));
    });
  }
}