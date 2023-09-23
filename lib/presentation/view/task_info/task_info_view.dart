import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskInfoView extends HookConsumerWidget {
  const TaskInfoView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEMES
    final globalTheme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Info tarea'),
      ),
      body: ListView(
        children: [
          Text('Nombre de la tarea',
              style: globalTheme.textTheme.headlineMedium),
          Text('19/01/2001'),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Tatea terminada'),
          )
        ],
      ),
    );
  }
}
