import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'read_notes_cubit_state.dart';

class ReadNotesCubitCubit extends Cubit<ReadNotesCubitState> {
  ReadNotesCubitCubit() : super(ReadNotesCubitInitial());

  List<NoteModel>? notes;
  fetchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(notesBox);
    notes = noteBox.values.toList();
    emit(ReadNotesCubitSuccess());
  }
}
