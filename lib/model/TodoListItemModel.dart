// To parse this JSON data, do
//
//     final todoListModel = todoListModelFromJson(jsonString);

import 'dart:convert';

List<TodoListModel> todoListModelFromJson(String str) => List<TodoListModel>.from(json.decode(str).map((x) => TodoListModel.fromJson(x)));

String todoListModelToJson(List<TodoListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoListModel {
  TodoListModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
