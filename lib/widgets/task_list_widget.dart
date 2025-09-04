import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_list.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, taskList, child) {
        if (taskList.tasks.isEmpty) {
          return const Center(
            child: Text('Nenhuma tarefa!\nClique no + para adicionar.'),
          );
        }

        return ListView.builder(
          itemCount: taskList.tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(taskList.tasks[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  taskList.removeTask(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tarefa removida!'))
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}