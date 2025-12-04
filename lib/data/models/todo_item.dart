import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';

@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    required String id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);
}