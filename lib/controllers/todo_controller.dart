import 'package:get/state_manager.dart';
import 'package:todo_app_getx/models/todo_model.dart';

class TodoController extends GetxController {
  var data = <TodoModel>[].obs;

  void addTodo(String title) {
    data.add(TodoModel(title: title));
  }

  void completedTodo(int index) {
    data[index].isComplete = !data[index].isComplete;
    data.refresh();
  }

  void deleteTodo(int index) {
    data.removeAt(index);
  }
}
