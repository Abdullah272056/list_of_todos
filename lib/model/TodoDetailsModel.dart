

import 'dart:convert';

TodoDetailsModel todoDetailsModelFromJson(String str) => TodoDetailsModel.fromJson(json.decode(str));

String todoDetailsModelToJson(TodoDetailsModel data) => json.encode(data.toJson());

class TodoDetailsModel {
  TodoDetailsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory TodoDetailsModel.fromJson(Map<String, dynamic> json) => TodoDetailsModel(
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
