import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/note_service.dart';
import 'package:provider_example/provider/tag_service.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final TextEditingController title = TextEditingController(),
      description = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    key.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<TagService>().selected);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note",
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (key.currentState?.validate() == true) {
                context.read<NoteService>().addNote(
                      title: title.text,
                      description: description.text,
                    );

                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              }
            },
            child: const Text(
              "Create",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: key,
        child: ListView(
          children: [
            TextFormField(
              validator: (value) =>
                  value?.isNotEmpty == true ? null : "Title is require",
              controller: title,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            TextFormField(
              validator: (value) =>
                  value?.isNotEmpty == true ? null : "Description is require",
              controller: description,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: "Description",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
