import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseManager {

  static void addEvent() {
    FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
        fromFirestore: (snapshot, _) {
          return TaskModel.fromJson(snapshot.data()!);
        }, toFirestore: (value, _) {
          return value.toJson();
        },);
  }
}