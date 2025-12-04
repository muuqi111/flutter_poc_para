import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/todo_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/todo_list_item.dart';
import '../widgets/add_todo_dialog.dart';
import '../../../core/config/constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final completedCount = ref.watch(completedTodosCountProvider);
    final pendingCount = ref.watch(pendingTodosCountProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes TODOs'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
            tooltip: 'Changer le thème',
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Card
          Container(
            margin: const EdgeInsets.all(AppConstants.spacingMd),
            padding: const EdgeInsets.all(AppConstants.spacingMd),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppConstants.radiusMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  icon: Icons.list,
                  label: 'Total',
                  value: '${todos.length}',
                  color: Theme.of(context).colorScheme.primary,
                ),
                _StatItem(
                  icon: Icons.pending_actions,
                  label: 'En cours',
                  value: '$pendingCount',
                  color: Theme.of(context).colorScheme.secondary,
                ),
                _StatItem(
                  icon: Icons.check_circle,
                  label: 'Terminées',
                  value: '$completedCount',
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
          ),

          // Liste des TODOs
          Expanded(
            child: todos.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox,
                          size: 100,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: AppConstants.spacingMd),
                        Text(
                          'Aucune TODO',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: AppConstants.spacingSm),
                        Text(
                          'Appuyez sur + pour ajouter une tâche',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingMd,
                    ),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return TodoListItem(
                        todo: todo,
                        onTap: () {
                          context.go('/detail/${todo.id}');
                        },
                        onToggle: () {
                          ref
                              .read(todoListProvider.notifier)
                              .toggleTodo(todo.id);
                        },
                        onDelete: () {
                          ref
                              .read(todoListProvider.notifier)
                              .removeTodo(todo.id);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => const AddTodoDialog(),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Nouvelle TODO'),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: AppConstants.spacingSm),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
