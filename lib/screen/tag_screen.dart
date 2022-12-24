import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/note_service.dart';

import '../provider/tag_service.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tag"),
        actions: [
          TextButton(
            onPressed: () {
              final TagService tagService = context.read<TagService>();
              context.read<NoteService>().tmpNote.tag = tagService.selected;

              // Navigator.of(context)
              //     .push(createRoute(ChangeNotifierProvider.value(
              //   value: tagService,
              //   child: const CreateNoteScreen(),
              // )));

              Navigator.pushNamed(context, '/create', arguments: tagService);
            },
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (_, index) {
          return CheckboxListTile(
            title: Text(tags[index]),
            value: context.watch<TagService>().selected.contains(tags[index]),
            onChanged: (value) {
              context.read<TagService>().select(tags[index]);
            },
          );
        },
      ),
    );
  }
}
