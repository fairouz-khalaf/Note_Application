import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/cubit/read_notes_cubit_cubit.dart';

import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/note_listview_builder.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubitCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            icon: Icons.search,
            text: "Notes",
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
