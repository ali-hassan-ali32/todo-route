import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/models/task_model.dart';

import '../../models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future<void> addTask(TaskModel task) async {
    var tasksCollection = getTasksCollection();
    var newDoc = tasksCollection.doc();
    task.id = newDoc.id;
    task.userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    await newDoc.set(task);
  }

  static void deleteTask(String id) async {
    var collectionRef = getTasksCollection();
    await collectionRef.doc(id).delete();
  }

  static void updateTask(TaskModel task) async {
    var collectionRef = getTasksCollection();
    await collectionRef.doc(task.id).update(task.toJson());
  }

  static void setDone(TaskModel task) async {
    var taskCollection = getTasksCollection();
    task.isDone = !task.isDone;
    await taskCollection.doc(task.id).update(task.toJson());
  }

  static Stream<QuerySnapshot<TaskModel>> getTasksList(DateTime date) {
    var userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    return getTasksCollection()
        .where('date',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static updateUser(UserModel? user) async {
    var collectionRef = getUsersCollection();
    await collectionRef.doc(user?.id).update(user?.toJson() ?? {});
  }

  static Future<void> addUser(UserModel newUser) async {
    var usersCollection = getUsersCollection();
    await usersCollection.doc(newUser.id).set(newUser);
  }

  static Stream<UserModel?> getUser() {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (userId.isEmpty) {
      return Stream.value(null);
    } else {
      return getUsersCollection().doc(userId).snapshots().map((user) {
        if (user.exists) {
          return UserModel.fromJson(user.data()!.toJson());
        } else {
          return null;
        }
      });
    }
  }

  static Future<void> createUserAccount(
      String email, String password, String name, String phone) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      addUser(UserModel(
          id: credential.user?.uid ?? '',
          name: name,
          phone: phone,
          email: email));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<UserCredential> loginUser(String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}