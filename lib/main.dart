import 'package:bloc_sample_project/bloc/counterBloc.dart';
import 'package:bloc_sample_project/counterApp.dart';
import 'package:bloc_sample_project/dataBase/dataHelper.dart';
import 'package:bloc_sample_project/repository/screens/blocs/notebloc.dart';
import 'package:bloc_sample_project/repository/screens/notesApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>CounterBloc(),
        ),
        BlocProvider(create: (_) =>NoteBloc(db_helper: DbHelper.db),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NotesApp()
      ),
    );
  }
}

