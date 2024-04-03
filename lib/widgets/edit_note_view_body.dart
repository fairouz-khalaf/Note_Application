import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/cubit/read_notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';

import 'package:note_app/widgets/custom_form_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 37,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;

              widget.note.save();
              BlocProvider.of<ReadNotesCubitCubit>(context).fetchAllNotes();

              Navigator.pop(context);
            },
            icon: Icons.check,
            text: "Edit Note",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
              onChanged: (value) {
                content = value;
              },
              maxLines: 7,
              hint: widget.note.subTitle),
        ],
      ),
    );
  }
}
