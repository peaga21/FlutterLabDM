import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task_list.dart';
import 'widgets/task_list_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Estado - Grupo 6',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas - Grupo 6'),
      ),
      body: const TaskListWidget(), // REMOVA O 'const' DAQUI
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  static void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTask = '';
        
        return AlertDialog(
          title: const Text('Nova Tarefa'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: const InputDecoration(hintText: 'Digite a tarefa'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (newTask.isNotEmpty) {
                  Provider.of<TaskList>(context, listen: false).addTask(newTask);
                  Navigator.of(context).pop();
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tarefa "$newTask" adicionada!'))
                  );
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}