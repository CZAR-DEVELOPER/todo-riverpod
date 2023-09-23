import 'package:alan_todo/domain/models/task/task_model.dart';
import 'package:alan_todo/presentation/shared/space/space_widgets.dart';
import 'package:alan_todo/presentation/view/task_editor/provider/task_editor_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskEditorView extends HookConsumerWidget {
  const TaskEditorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME
    final globalTheme = Theme.of(context);

    //FORM KEYS
    final taskFormKey = useMemoized(() => GlobalKey<FormState>());

    //NOTIFIERS
    final taskEditorNotifier = ref.read(taskEditorViewProvider.notifier);

    //HOOKS
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return Form(
      key: taskFormKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Crear nueva tarea',
                style: globalTheme.textTheme.titleLarge,
              ),
              SpaceY(),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Nombre de la tarea'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Rellena el campo";
                  }
                },
              ),
              SpaceY(),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Descripcion',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Rellena el campo";
                  }
                },
              ),
              SpaceY(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancelar')),
                  FilledButton.tonal(
                      onPressed: () {
                        //Create new task model
                        final newTask = TaskModel(
                            name: nameController.text,
                            description: descriptionController.text,
                            isChecked: false);

                        //Validate it
                        taskEditorNotifier.validateTaskForm(
                            context: context,
                            taskFormKey: taskFormKey,
                            task: newTask);
                      },
                      child: Text('Crear tarea'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
