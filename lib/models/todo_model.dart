class TodoModel {
  String title;
  bool isComplete;

  TodoModel({
    required this.title,
    this.isComplete = false,
  });
}
