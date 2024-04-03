import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app/add_note_cubit/cubit/add_notes_cubit.dart';
import 'package:note_app/add_note_cubit/cubit/read_notes_cubit_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesFailure) {
            // using  package
            print("Failed ${state.errorMessage}");
          }
          if (state is AddNotesSuccess) {
            BlocProvider.of<ReadNotesCubitCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
