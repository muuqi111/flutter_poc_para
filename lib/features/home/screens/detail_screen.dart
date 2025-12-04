import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/todo_provider.dart';
import '../../../core/config/constants.dart';

class DetailScreen extends ConsumerWidget {
  final String todoId;

  const DetailScreen({
    super.key,
    required this.todoId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoByIdProvider(todoId));

    if (todo == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Erreur'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64),
              const SizedBox(height: AppConstants.spacingMd),
              const Text('TODO non trouvée'),
              const SizedBox(height: AppConstants.spacingMd),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Retour à l\'accueil'),
              ),
            ],
          ),
        ),
      );
    }

    final dateFormat = DateFormat('dd/MM/yyyy à HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la TODO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmation(context, ref, todoId);
            },
            tooltip: 'Supprimer',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingMd,
                vertical: AppConstants.spacingSm,
              ),
              decoration: BoxDecoration(
                color: todo.isCompleted
                    ? Theme.of(context).colorScheme.tertiaryContainer
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(AppConstants.radiusSm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    todo.isCompleted
                        ? Icons.check_circle
                        : Icons.pending_actions,
                    size: 20,
                  ),
                  const SizedBox(width: AppConstants.spacingSm),
                  Text(
                    todo.isCompleted ? 'Terminée' : 'En cours',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.spacingLg),

            // Titre
            Text(
              'Titre',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: AppConstants.spacingSm),
            Text(
              todo.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: AppConstants.spacingLg),

            // Description
            Text(
              'Description',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: AppConstants.spacingSm),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingMd),
                child: Text(
                  todo.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),

            const SizedBox(height: AppConstants.spacingLg),

            // Informations temporelles
            _InfoCard(
              icon: Icons.calendar_today,
              label: 'Créée le',
              value: dateFormat.format(todo.createdAt),
            ),

            if (todo.completedAt != null) ...[
              const SizedBox(height: AppConstants.spacingMd),
              _InfoCard(
                icon: Icons.check_circle,
                label: 'Terminée le',
                value: dateFormat.format(todo.completedAt!),
              ),
            ],

            const SizedBox(height: AppConstants.spacingXl),

            // Actions
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ref.read(todoListProvider.notifier).toggleTodo(todoId);
                },
                icon: Icon(
                  todo.isCompleted ? Icons.restart_alt : Icons.check,
                ),
                label: Text(
                  todo.isCompleted
                      ? 'Marquer comme en cours'
                      : 'Marquer comme terminée',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(
      BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer la TODO ?'),
        content: const Text(
          'Cette action est irréversible. Voulez-vous vraiment supprimer cette TODO ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(todoListProvider.notifier).removeTodo(id);
              Navigator.of(context).pop();
              context.go('/');
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingMd),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: AppConstants.spacingMd),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
