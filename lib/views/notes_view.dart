import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/cubit/read_notes_cubit_cubit.dart';
import 'package:note_app/widgets/add_note_buttomsheet.dart';
import 'package:note_app/widgets/note_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNotesCubitCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return AddNoteButtomSheet();
                });
          },
          child: Icon(Icons.add),
        ),
        body: NoteViewBody(),
      ),
    );
  }
}
