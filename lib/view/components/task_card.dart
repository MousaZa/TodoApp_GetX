import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.title, required this.description, required this.completed, this.onChanged, required this.icon});
  final String title;
  final String description;
  final bool completed;
  final IconData icon;
  final Function(bool?)? onChanged;

  @override

  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        leading: Icon(icon),
        trailing: Checkbox(

          value: completed,
          onChanged: onChanged,
        )
      ),
    );
  }
}
