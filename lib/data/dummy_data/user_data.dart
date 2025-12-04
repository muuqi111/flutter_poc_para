import '../models/user.dart';

/// Utilisateur mocké pour la démo
final User dummyUser = User(
  id: 'user_001',
  name: 'Jean Dupont',
  email: 'jean.dupont@email.com',
  photoUrl: null, // Peut être remplacé par un asset ou URL
  balance: 25.00,
  registrationDate: DateTime(2024, 9, 1),
  notificationsEnabled: true,
  language: 'fr',
);
