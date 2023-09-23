import 'package:alan_todo/domain/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskFirebaseNotiNotifier extends StateNotifier<dynamic> {
  TaskFirebaseNotiNotifier() : super(null);

  //Firestore reference
  final firebaseRef = FirebaseFirestore.instance.collection('tasks');

  //------------------FIREBASE CRUD------------------

  Future<DocumentReference<Map<String, dynamic>>> create(TaskModel task) {
    return firebaseRef.add(task.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readAll() {
    return firebaseRef.snapshots();
  }

  Future<void> update(TaskModel task) {
    return firebaseRef.doc(task.firebaseId).set(task.toMap());
  }

  Future<void> delete(TaskModel task) {
    return firebaseRef.doc(task.firebaseId).delete();
  }
}

final taskFirebaseProvider =
    StateNotifierProvider<TaskFirebaseNotiNotifier, dynamic>((ref) {
  return TaskFirebaseNotiNotifier();
});
