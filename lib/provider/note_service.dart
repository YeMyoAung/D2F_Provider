import 'package:flutter/material.dart';

import '../model/note_model.dart';

class NoteService extends ChangeNotifier {
  NoteModel tmpNote = NoteModel();

  final List<NoteModel> database = [];

  ///ToDo::
  void addNote({
    required String title,
    required String description,
  }) {
    tmpNote.title = title;
    tmpNote.description = description;

    database.add(tmpNote);

    notifyListeners();
    tmpNote = NoteModel();
  }

  ///ToDo::
  void editNote() {}

  ///ToDo::
  void deleteNote() {}
}
