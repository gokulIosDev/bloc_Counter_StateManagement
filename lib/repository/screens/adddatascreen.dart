import 'dart:developer';

import 'package:bloc_sample_project/models/noteModel.dart';
import 'package:bloc_sample_project/repository/screens/blocs/noteEvents.dart';
import 'package:bloc_sample_project/repository/screens/blocs/notebloc.dart';
import 'package:bloc_sample_project/repository/screens/notesApp.dart';
import 'package:bloc_sample_project/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDataScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          UiHelper.customTextField(
              titleController, "Enter Title", "Title", Icons.title),
          const SizedBox(
            height: 10,
          ),
          UiHelper.customTextField(descriptionController, "Enter desc",
              "Description", Icons.description),
          ElevatedButton(
              onPressed: () {
                addData(titleController.text.toString(),
                    descriptionController.text.toString(), context);
                Navigator.pop(context);
              },
              child: const Text("Save"))
        ],
      ),
    );
  }

  addData(String title, String desc, BuildContext context) {
    if (title == "" || desc == "") {
      log("Enter Required Field");
    } else {
      BlocProvider.of<NoteBloc>(context)
          .add(AddNotesEvents(newNote: NoteModels(desc: desc, title: title)));
    }
  }
}
