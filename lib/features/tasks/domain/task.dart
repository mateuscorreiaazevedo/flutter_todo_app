class Task {
  final String id;
  final String title;
  final String? description;
  final bool isDone;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Task({
    required this.id,
    required this.title,
    this.description,
    this.isDone = false,
    required this.createdAt,
    this.updatedAt,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
