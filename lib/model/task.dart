// class Task {
//
//   Task({required this.title, required this.description, required this.completed});
//
//   String title;
//   String description;
//   bool completed;
//
// }
import 'package:flutter/material.dart';

class Task {
  static int _counter = 0;
  final int id;
  String title;
  String description;
  bool completed;
  final IconData icon ;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'completed': completed,
    'icon': icon.codePoint,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    IconData(json['icon'], fontFamily: 'MaterialIcons'),
    title: json['title'],
    description: json['description'],
    completed: json['completed'],
  );

  Task(this.icon, {required this.title, required this.description, required this.completed}) : id = _counter++;
}