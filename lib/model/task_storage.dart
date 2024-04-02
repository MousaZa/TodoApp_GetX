import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/task.dart';

class TaskStorage {
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = jsonEncode(tasks.map((task) => task.toJson()).toList());
    prefs.setString('tasks', tasksString);
  }

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks') ?? '[]';
    final tasksList = jsonDecode(tasksString) as List;
    return tasksList.map((task) => Task.fromJson(task)).toList();
  }
}