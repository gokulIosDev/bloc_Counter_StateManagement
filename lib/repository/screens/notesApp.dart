import 'package:bloc_sample_project/repository/screens/adddatascreen.dart';
import 'package:bloc_sample_project/repository/screens/blocs/noteEvents.dart';
import 'package:bloc_sample_project/repository/screens/blocs/notebloc.dart';
import 'package:bloc_sample_project/repository/screens/blocs/notesStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
        centerTitle: true,
      ),
      body: BlocBuilder<NoteBloc, NotesState>(builder: (context, state) {
        if (state is NotesLoadingStale) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NotesLoadedState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${index + 1}"),
                title: Text(state.noteModel[index].title.toString()),
                subtitle: Text(state.noteModel[index].desc.toString()),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
            itemCount: state.noteModel.length,
          );
        } else if (state is NotesErrorState) {
          return Center(child: Text(state.error.toString()));
        }
        return Center(
          child: Text("No Data Added yet!"),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDataScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
