import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/note_model.dart';
import 'package:provider_example/provider/note_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<TagService>();

    ///String => title
    ///int    =>
    ///double =>
    ///List   => [title,tag,des] => [[title,tag,des],[title,tag,des],] => [0][3]
    ///Map    => {'title':'kjfaljas','tag':'','des':'des'} => [{'title':'kjfaljas','tag':'','des':'des'}] => [0]['titile']
    ///(class,object,model)  => title,tag,des   => [class,class,class] => [0].title
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App"),
      ),
      body: ListView.builder(
        itemCount: context.watch<NoteService>().database.length,
        itemBuilder: (context, index) {
          final NoteModel model = context.read<NoteService>().database[index];
          return Card(
            child: ListTile(
              title: Text(
                model.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                model.description,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/tag');
          // Navigator.of(context).pushNamed('/tag');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
