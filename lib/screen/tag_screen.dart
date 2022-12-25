import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/note_service.dart';
import '../provider/tag_service.dart';

class TagScreen extends StatelessWidget {
  final String name;
  const TagScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    ///context.watch<>() => Provider
    ///Consumer3<Provider1,Provider2,Provider3> ==
    ///Selector
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tag"),
        actions: const [
          // TextButton(
          //   onPressed: () {
          //     final TagService tagService = context.read<TagService>();
          //     context.read<NoteService>().tmpNote.tag = tagService.selected;

          //     // Navigator.of(context)
          //     //     .push(createRoute(ChangeNotifierProvider.value(
          //     //   value: tagService,
          //     //   child: const CreateNoteScreen(),
          //     // )));

          //     Navigator.pushNamed(context, '/create', arguments: tagService);
          //   },
          //   child: const Text(
          //     "Next",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.read<TagService>().selectDate(context);
            },
            child: const Text("Date"),
          ),

          const DateWidget(),
          const CheckBoxWidget(),
          const ConsumerWidget(),

          // ChangeNotifierProvider(
          //   lazy: true,
          //   create: (context) => TagServiceThree(),
          //   child: ChangeNotifierProvider(
          //     lazy: true,
          //     create: (context) => TagServiceTwo(),
          //     child: const ThreeProviderWidget(),
          //   ),
          // ),

          // Expanded(
          //   child: Consumer<TagService>(
          //     builder: (_, providerValue, widget) {
          //       print("rebuild");

          //       ///rebuild
          //       ///const =>
          //       return Column(
          //         children: [
          //           widget!,
          //           ConsumerChildWidget(
          //             name: "$name-normal",
          //           ),
          //           const Text('data'),
          //           ConsumerChildWidget(
          //             name: "Normal Method",
          //             child: Text(providerValue.selected.toString()),
          //           ),
          //         ],
          //       );
          // return ListView.builder(
          //   itemCount: tags.length,
          //   itemBuilder: (_, index) {
          //     print("ui is rebuild");
          //     return CheckboxListTile(
          //       title: Text(tags[index]),
          //       value: context
          //           .watch<TagService>()
          //           .selected
          //           .contains(tags[index]),
          //       onChanged: (value) {
          //         context.read<TagService>().select(tags[index]);
          //       },
          //     );
          //   },
          // );
          //     },
          //     child: ConsumerChildWidget(
          //       name: name,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("DateWidget is rebuild");
    return Text(context.watch<TagService>().date.toString());
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("CheckBoxWidget is build");
    return CheckboxListTile(
      value: context.watch<TagService>().selected.contains('Personal'),
      onChanged: (_) {
        context.read<TagService>().select('Personal');
      },
    );
  }
}

class ConsumerWidget extends StatelessWidget {
  const ConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pp = context.read<TagService>();
    return Consumer<TagService>(
      builder: (_, provider, child) {
        print("ConsumerWidget is rebuild");
        return Column(
          children: [
            NoneRebuildWidget(
              value: "Without Child ${pp.toString()}",
            ),
            child!,
            CheckboxListTile(
              value: provider.selected.contains('Family'),
              onChanged: (_) {
                provider.select('Family');
              },
            ),
          ],
        );
      },
      child: NoneRebuildWidget(
        value: pp.toString(),
      ),
    );
  }
}

class NoneRebuildWidget extends StatelessWidget {
  final String value;
  const NoneRebuildWidget({super.key, this.value = ''});

  @override
  Widget build(BuildContext context) {
    print("NoneRebuildWidget is rebuild $value");
    return const Text("NoneRebuildWidget");
  }
}

class MultiConsumerWidget extends StatelessWidget {
  const MultiConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///Consumer  => Provider => 1 Listen
    ///Consumer2 => Provider => 2 Listen
    ///Consumer3 => Provider => 3 Listen
    return Consumer2<TagServiceTwo, TagService>(
      builder: (context, tagservicetwo, tagserivce, child) {
        return Text(tagservicetwo.i.toString());
      },
    );
  }
}

class ThreeProviderWidget extends StatelessWidget {
  const ThreeProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Text(context.read<TagServiceThree>().i.toString());
    return Consumer4<TagService, TagServiceTwo, TagServiceThree, NoteService>(
      builder: (buildContext, tagservice, tagservicetwo, tagservicethree,
          noteservice, child) {
        noteservice.database;
        return const Text("");
      },
    );
  }
}

class ProviderWithSelectorWidget extends StatelessWidget {
  const ProviderWithSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///Selector2,Selector3,Selector4
    return Selector<TagServiceTwo, int>(
      builder: (context, value, child) {
        print("Selector is rebuild");
        return Column(
          children: [
            Text(DateTime.now().toString()),
            child!,
          ],
        );
      },
      selector: (context, provider) {
        return provider.i;
      },
      shouldRebuild: (current, changes) {
        print("shouldRebuild:previous $current");
        print("shouldRebuild:next $changes");
        return changes == 3;
      },
      child: TextButton(
        onPressed: () {
          context.read<TagServiceTwo>().add();
        },
        child: const Text("Add"),
      ),
    );
  }
}
