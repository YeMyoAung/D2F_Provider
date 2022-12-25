import 'package:flutter/material.dart';

import '../model/note_model.dart';

class NoteService extends ChangeNotifier {
  NoteModel tmpNote = NoteModel();

  ///class,map,list => object ,tmpNote(mirror)

  final List<NoteModel> database = [];

  NoteService([this.i = 0]);

  int i = 0;

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
