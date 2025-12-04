import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/todo_item.dart';
import '../../../data/dummy_data.dart';

// Provider pour la liste de TODOs
// Utilise un StateNotifierProvider pour permettre les modifications
class TodoListNotifier extends StateNotifier<List<TodoItem>> {
  TodoListNotifier() : super(dummyTodos);

  // Ajouter une TODO
  void addTodo(String title, String description) {
    final newTodo = TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    state = [...state, newTodo];
  }

  // Supprimer une TODO
  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  // Toggle le statut completed d'une TODO
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(
            isCompleted: !todo.isCompleted,
            completedAt: !todo.isCompleted ? DateTime.now() : null,
          )
        else
          todo,
    ];
  }

  // Mettre à jour une TODO
  void updateTodo(String id, String title, String description) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(
            title: title,
            description: description,
          )
        else
          todo,
    ];
  }
}

// Provider pour accéder à la liste de TODOs
final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoItem>>((ref) {
  return TodoListNotifier();
});

// Provider pour obtenir une TODO spécifique par ID
final todoByIdProvider = Provider.family<TodoItem?, String>((ref, id) {
  final todos = ref.watch(todoListProvider);
  try {
    return todos.firstWhere((todo) => todo.id == id);
  } catch (e) {
    return null;
  }
});

// Provider pour le nombre de TODOs complétées
final completedTodosCountProvider = Provider<int>((ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => todo.isCompleted).length;
});

// Provider pour le nombre de TODOs en cours
final pendingTodosCountProvider = Provider<int>((ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => !todo.isCompleted).length;
});
