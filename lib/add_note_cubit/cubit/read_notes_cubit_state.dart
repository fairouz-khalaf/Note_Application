part of 'read_notes_cubit_cubit.dart';

@immutable
sealed class ReadNotesCubitState {}

final class ReadNotesCubitInitial extends ReadNotesCubitState {}

final class ReadNotesCubitSuccess extends ReadNotesCubitState {}
