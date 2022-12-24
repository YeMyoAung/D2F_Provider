class NoteModel {
  ///slug => url (seo)
  ///tag  => category
  late String title, description;
  late List tag;

  NoteModel({
    this.tag = const [],
    this.title = '',
    this.description = '',
  });

  void clear() {
    title = '';
    description = '';
    tag = const [];
  }
}
