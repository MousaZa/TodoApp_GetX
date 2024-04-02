

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/task.dart';
import '../model/task_storage.dart';
import '../view/components/icon_picker.dart';

class HomeController extends GetxController {
  List<Task> tasks = <Task>[];
  final TaskStorage taskStorage = TaskStorage();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }
  Future<void> loadTasks() async {
    tasks = await taskStorage.loadTasks();
    update();
  }

  void deleteCompletedTasks() {
    tasks.removeWhere((task) => task.completed);
    taskStorage.saveTasks(tasks);
    update();
  }

  void addTask() {

    String title = '' , description = '';
    IconData icon = Icons.task;

    Get.dialog(
      AlertDialog(
        title: Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (val) {
                title = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (val) {
                description = val;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Icon: ',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                StatefulBuilder(builder: (context, setState) {
                  return IconButton(
                    icon: Icon(icon),
                    onPressed: () async {
                      icon = await Get.defaultDialog(
                        content: IconPicker(),
                      );
                      setState(() {});
                    },
                  );
                }),
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              tasks.add(Task(icon,title: title, description: description, completed: false));
              taskStorage.saveTasks(tasks);
              update();
              Get.back();
              Get.snackbar('Hoorray!', 'Task added successfully!',duration: Duration(seconds: 5));
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }



  void showSnackbar() {
    Get.snackbar('Hello', 'task added successfully!',);
  }

  void updateTask(Task task) {
    task.completed = !task.completed;
    taskStorage.saveTasks(tasks);
    update();
  }

}