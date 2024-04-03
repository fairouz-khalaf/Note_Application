import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/add_note_cubit/cubit/add_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list_view.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formState = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: formState,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomFormField(
            onSave: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomFormField(
            onSave: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 6,
          ),
          const SizedBox(
            height: 30,
          ),
          const ColorListView(),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formState.currentState!.validate()) {
                    formState.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatedCurrentDate =
                        DateFormat.yMd().format(currentDate);
                    BlocProvider.of<AddNotesCubit>(context).addNote(NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        data: formatedCurrentDate,
                        color: Colors.blue.value));
                  }
                  Navigator.pop(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 45,
          )
        ],
      ),
    );
  }
}
