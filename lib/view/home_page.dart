import 'package:copilot_test/controller/home_controller.dart';
import 'package:copilot_test/view/components/task_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Todo App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<HomeController>(
            builder: (HomeController controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text('Pending Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        return !controller.tasks[index].completed ? TaskCard(
                          icon: controller.tasks[index].icon,
                          title: controller.tasks[index].title,
                          description: controller.tasks[index].description,
                          completed: controller.tasks[index].completed,
                          onChanged: (val) {
                            controller.updateTask(controller.tasks[index]);
                          },
                        ) : Container();
                      },
                    )
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Completed Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red,),
                        onPressed: () {
                          controller.deleteCompletedTasks();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        return controller.tasks[index].completed ? TaskCard(
                          icon: controller.tasks[index].icon,
                          title: controller.tasks[index].title,
                          description: controller.tasks[index].description,
                          completed: controller.tasks[index].completed,
                          onChanged: (val) {
                            controller.updateTask(controller.tasks[index]) ;}
                        ) : Container();
                      },
                    )
                  ),
                ],
              );
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.addTask();
          },
          child: Icon(Icons.add),
        )
    );
  }
}
