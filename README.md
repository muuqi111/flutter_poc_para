# Flutter POC - TODO List App

Application Flutter POC (Proof of Concept) sans backend, avec données hardcodées, démontrant l'utilisation de Riverpod, go_router et Material Design 3.

## Fonctionnalités

- Liste de TODOs avec ajout, suppression et toggle de statut
- Navigation entre liste et détail d'une TODO
- Thème Material 3 avec support light/dark mode
- State management avec Riverpod
- Données en dur (aucun backend requis)
- Architecture propre et scalable

## Technologies

- **Flutter SDK**: 3.24+
- **Dart**: 3.5+
- **State Management**: flutter_riverpod 2.x
- **Navigation**: go_router
- **UI**: Material Design 3
- **Models**: freezed + json_annotation

## Comment lancer le projet

### Prérequis

- Flutter SDK installé (version 3.24+)
- Un IDE (VS Code ou Android Studio)
- Un émulateur ou device physique

### Installation

1. Cloner le projet ou se placer dans le dossier :
```bash
cd flutter_poc
```

2. Installer les dépendances :
```bash
flutter pub get
```

3. Lancer l'application :
```bash
flutter run
```

## Structure du projet

```
lib/
├── core/
│   ├── config/
│   │   ├── theme.dart              # Thèmes Material 3 light/dark
│   │   └── constants.dart          # Constantes globales
│   ├── router/
│   │   └── app_router.dart         # Configuration go_router
│   └── widgets/                     # Widgets réutilisables
├── data/
│   ├── models/
│   │   ├── todo_item.dart          # Model TodoItem avec Freezed
│   │   ├── todo_item.freezed.dart  # Généré automatiquement
│   │   └── todo_item.g.dart        # Généré automatiquement
│   └── dummy_data.dart              # Données hardcodées
├── features/
│   └── home/
│       ├── providers/
│       │   ├── todo_provider.dart       # Provider pour les TODOs
│       │   └── theme_provider.dart      # Provider pour le thème
│       ├── screens/
│       │   ├── home_screen.dart         # Écran liste des TODOs
│       │   └── detail_screen.dart       # Écran détail d'une TODO
│       └── widgets/
│           ├── todo_list_item.dart      # Widget item de la liste
│           └── add_todo_dialog.dart     # Dialog d'ajout de TODO
└── main.dart                         # Point d'entrée de l'app
```

## Architecture

### State Management (Riverpod)

L'application utilise **flutter_riverpod** pour le state management :

- `todoListProvider` : Gère la liste des TODOs (ajout, suppression, toggle)
- `themeModeProvider` : Gère le thème light/dark
- `todoByIdProvider` : Récupère une TODO spécifique par ID
- Providers pour les compteurs (completed, pending)

### Navigation (go_router)

La navigation est gérée par **go_router** :

- Route `/` : HomeScreen (liste des TODOs)
- Route `/detail/:id` : DetailScreen (détail d'une TODO)

### Données (Dummy Data)

Les données sont hardcodées dans `lib/data/dummy_data.dart`. Aucun appel API ou backend n'est nécessaire. Les modifications sont maintenues en mémoire pendant la session.

## Comment ajouter une nouvelle feature

### 1. Créer une nouvelle feature

```bash
lib/features/ma_feature/
├── providers/
├── screens/
└── widgets/
```

### 2. Créer un nouveau model (si nécessaire)

Créer un fichier dans `lib/data/models/` :

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mon_model.freezed.dart';
part 'mon_model.g.dart';

@freezed
class MonModel with _$MonModel {
  const factory MonModel({
    required String id,
    required String name,
  }) = _MonModel;

  factory MonModel.fromJson(Map<String, dynamic> json) =>
      _$MonModelFromJson(json);
}
```

Puis générer les fichiers :

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Créer un provider

Dans `lib/features/ma_feature/providers/` :

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaFeatureNotifier extends StateNotifier<List<MonModel>> {
  MaFeatureNotifier() : super([]);

  void maMethode() {
    // Logique métier
  }
}

final maFeatureProvider = StateNotifierProvider<MaFeatureNotifier, List<MonModel>>((ref) {
  return MaFeatureNotifier();
});
```

### 4. Créer un écran

Dans `lib/features/ma_feature/screens/` :

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonScreen extends ConsumerWidget {
  const MonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(maFeatureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mon Screen')),
      body: // Votre UI
    );
  }
}
```

### 5. Ajouter la route

Dans `lib/core/router/app_router.dart` :

```dart
GoRoute(
  path: '/ma-feature',
  name: 'ma-feature',
  builder: (context, state) => const MonScreen(),
),
```

## Commandes utiles

### Lancer l'application
```bash
flutter run
```

### Générer les fichiers Freezed/JSON
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Vérifier les warnings/erreurs
```bash
flutter analyze
```

### Formater le code
```bash
dart format .
```

### Tests (à implémenter)
```bash
flutter test
```

## Thème et Design

L'application utilise **Material Design 3** avec :

- Support du mode clair/sombre
- Couleurs générées automatiquement à partir d'une seed color
- Composants Material 3 (Cards, Buttons, etc.)
- Toggle de thème accessible depuis l'AppBar

Pour modifier les couleurs primaires, éditer `lib/core/config/theme.dart` :

```dart
static const Color primaryLight = Color(0xFF6750A4);  // Violet
static const Color primaryDark = Color(0xFFD0BCFF);   // Violet clair
```

## Configuration du linter

Le fichier `analysis_options.yaml` contient des règles de linting strictes :

- Prefer const constructors
- Single quotes
- Trailing commas
- Et bien d'autres...

Les fichiers générés (`.g.dart`, `.freezed.dart`) sont automatiquement exclus de l'analyse.

## Prochaines étapes possibles

- Ajouter la persistance locale (shared_preferences, hive)
- Implémenter des tests unitaires et widgets
- Ajouter des animations
- Implémenter un système de filtres/recherche
- Ajouter plus de features

## Licence

Projet POC à usage libre.
