import 'package:flutter/foundation.dart';

class TaskList extends ChangeNotifier {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}