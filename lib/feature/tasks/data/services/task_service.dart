
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class TaskService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // 1. Add Task
  Future<void> addTask(TaskModel task) async {
    await _firestore.collection('tasks').add(
      task.toJson(),
    );
  }

  // 2. Get Tasks
  Stream<List<TaskModel>> getTasks() {
    return _firestore
        .collection('tasks')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromJson(
          doc.data(),
          doc.id,
        );
      }).toList();
    });
  }

  // 3. Update Task
  Future<void> updateTask(
    TaskModel task,
  ) async {
    await _firestore
        .collection('tasks')
        .doc(task.id)
        .update(task.toJson());
  }

  // 4. Delete Task
  Future<void> deleteTask(String id) async {
    await _firestore
        .collection('tasks')
        .doc(id)
        .delete();
  }
}
