
class TaskModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String category;
  final DateTime? dueDate;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.category,
    this.dueDate,
  });

  factory TaskModel.fromJson(
    Map<String, dynamic> json,
    String id,
  ) {
    return TaskModel(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      category: json['category'] ?? '',
      dueDate: json['dueDate'] == null
          ? null
          : (json['dueDate'] as dynamic).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'category': category,
      'dueDate': dueDate,
    };
  }
}
