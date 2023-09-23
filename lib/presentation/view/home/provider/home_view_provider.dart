import 'package:alan_todo/domain/models/models.dart';
import 'package:alan_todo/domain/providers/firebase/task/task_firebase_provider.dart';
import 'package:alan_todo/presentation/view/task_editor/task_editor_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewNotifier extends StateNotifier<List<TaskModel>> {
  HomeViewNotifier(TaskFirebaseNotiNotifier taskFirebaseNotifier)
      : taskFirebaseProvider = taskFirebaseNotifier,
        super([]) {
    readAllTasks();
  }

  final TaskFirebaseNotiNotifier taskFirebaseProvider;

  //TASKS

  List<TaskModel> taskList = [];

  openEditor(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return TaskEditorView();
        });
  }

  navigateToTaskInfo(BuildContext context) {
    Navigator.pushNamed(context, '/task');
  }

  //TASKS
  readAllTasks() async {
    await taskFirebaseProvider.readAll().listen((QuerySnapshot tasks) {
      taskList = [];

      tasks.docs.forEach((task) {
        //Clean all

        final TaskModel newTask =
            TaskModel.fromMap(task.data() as Map<String, dynamic>);
        taskList.add(newTask);

        print('DATOS');
      });

      print(tasks.docs);
      super.state = taskList;
    }, onError: (e) => print("Error updating document $e"));
  }

  deleteTask(TaskModel task) {
    taskFirebaseProvider.delete(task).then((value) {
      Text('Creado correctamente');
    }, onError: (e) {
      print('Error');
    });
  }
}

final homeViewProvider =
    StateNotifierProvider<HomeViewNotifier, dynamic>((ref) {
  final _taskFirebaseProvider = ref.read(taskFirebaseProvider.notifier);

  return HomeViewNotifier(_taskFirebaseProvider);
});
