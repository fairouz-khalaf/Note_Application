import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = Color(0xFFA34343);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(notesBox);
      await noteBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(errorMessage: e.toString()));
    }
  }
}
