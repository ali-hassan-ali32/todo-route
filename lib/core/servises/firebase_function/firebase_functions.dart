import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance.collection('Task').withConverter<TaskModel>(
        fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
        toFirestore: (task, _) => task.toJson(),);
  }

  static Future<void> addTask(TaskModel task) {
    var tasksCollection = getTasksCollection();
    var newDoc = tasksCollection.doc();
    task.id = newDoc.id;
    return newDoc.set(task);
  }
  static deleteTask(String id) async{
    var collectionRef = getTasksCollection();
    await collectionRef.doc(id).delete();
  }
  static updateTask(TaskModel task) async{
    var collectionRef = getTasksCollection();
    await collectionRef.doc(task.id).update(task.toJson());
  }
  static Future<QuerySnapshot<TaskModel>> getTasksList() {
    var collectonRef = getTasksCollection();
    return collectonRef.get();
  }
}