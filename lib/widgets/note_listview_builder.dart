import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/cubit/read_notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubitCubit, ReadNotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<ReadNotesCubitCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,

              // itemCount: ,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
