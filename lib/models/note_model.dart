import 'package:hive/hive.dart';

part 'note_model.g.dart';

// the name file is note_model.g.dart

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  // hiveField unique per class
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String data;
  @HiveField(3)
  int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.data,
      required this.color});
}
