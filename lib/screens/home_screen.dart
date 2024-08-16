import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: todoController.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Obx(
                  () => Text(
                    todoController.data[index].title,
                    style: TextStyle(
                      decoration: todoController.data[index].isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                leading: Obx(
                  () => Checkbox(
                    value: todoController.data[index].isComplete,
                    onChanged: (value) => todoController.completedTodo(index),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => todoController.deleteTodo(index),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(AddTodoDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddTodoDialog extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final TodoController todoController = Get.find();

  AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: _textController,
        decoration: const InputDecoration(hintText: 'Enter todo title'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            todoController.addTodo(_textController.text);
            Get.back();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
