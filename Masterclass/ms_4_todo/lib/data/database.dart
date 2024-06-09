import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference
  final _myBox = Hive.box('mybox');

  //first time ever opening app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  //load data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
