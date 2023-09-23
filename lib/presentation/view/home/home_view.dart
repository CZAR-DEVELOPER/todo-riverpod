import 'package:alan_todo/presentation/view/home/provider/home_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEMES
    final globalTheme = Theme.of(context);

    //NOTIFIERS
    final taskEditorNotifier = ref.read(homeViewProvider.notifier);

    //PROVIDERS
    final taskEditorProvider = ref.watch(homeViewProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => taskEditorNotifier.openEditor(context),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('To do list')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Tareas creadas',
              style: globalTheme.textTheme.headlineLarge,
            ),
          ),
          for (var i = 0; i < taskEditorProvider.length; i++)
            ListTile(
              onTap: () => taskEditorNotifier.navigateToTaskInfo(context),
              leading: Icon(
                Icons.task_alt_outlined,
                color: globalTheme.colorScheme.primary,
              ),
              title: Text(taskEditorProvider[i].name),
              subtitle: Opacity(
                  opacity: .5,
                  child: Text(taskEditorProvider[i].isChecked == true
                      ? 'Terminado'
                      : 'No terminado')),
              trailing: IconButton(
                  onPressed: () {
                    taskEditorNotifier.deleteTask(taskEditorProvider[i]);
                  },
                  icon: Icon(Icons.delete_outline)),
            )
        ],
      ),
    );
  }
}
