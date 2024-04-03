import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/add_note_cubit/cubit/read_notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    //delete provided by extend HiveObject
                    note.delete();
                    BlocProvider.of<ReadNotesCubitCubit>(context)
                        .fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  note.data,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
