import 'models/todo_item.dart';

// Données hardcodées pour le POC
final List<TodoItem> dummyTodos = [
  TodoItem(
    id: '1',
    title: 'Configurer le projet Flutter',
    description: 'Installer Flutter SDK et configurer l\'environnement de développement',
    isCompleted: true,
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
    completedAt: DateTime.now().subtract(const Duration(days: 4)),
  ),
  TodoItem(
    id: '2',
    title: 'Implémenter Riverpod',
    description: 'Mettre en place le state management avec Flutter Riverpod',
    isCompleted: true,
    createdAt: DateTime.now().subtract(const Duration(days: 4)),
    completedAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
  TodoItem(
    id: '3',
    title: 'Configurer la navigation',
    description: 'Intégrer go_router pour la navigation entre les écrans',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
  TodoItem(
    id: '4',
    title: 'Créer les écrans UI',
    description: 'Développer les interfaces utilisateur avec Material Design 3',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  TodoItem(
    id: '5',
    title: 'Ajouter des animations',
    description: 'Intégrer des animations fluides pour améliorer l\'UX',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  TodoItem(
    id: '6',
    title: 'Tests unitaires',
    description: 'Écrire des tests pour valider la logique métier',
    createdAt: DateTime.now(),
  ),
];