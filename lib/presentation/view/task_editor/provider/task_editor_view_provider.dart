import 'package:alan_todo/domain/models/task/task_model.dart';
import 'package:alan_todo/domain/providers/firebase/task/task_firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskEditorViewNotifier extends StateNotifier<dynamic> {
  TaskEditorViewNotifier(TaskFirebaseNotiNotifier taskFirebaseNotifier)
      : taskFirebaseProvider = taskFirebaseNotifier,
        super(null) {
    print('EJEMPLO');
  }

  final TaskFirebaseNotiNotifier taskFirebaseProvider;

  validateTaskForm(
      {required BuildContext context,
      required GlobalKey<FormState> taskFormKey,
      required TaskModel task}) {
    //Check if formkey is valid
    if (taskFormKey.currentState!.validate()) {
      createTask(context: context, task: task);
    }
  }

  //---------------------TASKS---------------------
  createTask(
      {required BuildContext context,
      required TaskModel task,
      required}) async {
    print('Creating task');

    await taskFirebaseProvider.create(task).then((value) {
      //CLOSE DIALOG
      Navigator.of(context).pop();
      print('Creado con exito');
    }, onError: (e) => print("Error updating document $e"));
  }
}

final taskEditorViewProvider =
    StateNotifierProvider<TaskEditorViewNotifier, dynamic>((ref) {
  final _taskFirebaseProvider = ref.read(taskFirebaseProvider.notifier);
  return TaskEditorViewNotifier(_taskFirebaseProvider);
});
