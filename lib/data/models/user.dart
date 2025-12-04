import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._(); // Constructeur privé nécessaire pour les extensions

  const factory User({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
    @Default(0.0) double balance, // Solde du compte (€)
    required DateTime registrationDate,
    @Default(true) bool notificationsEnabled,
    @Default('fr') String language, // 'fr' ou 'en'
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Vérifie si l'utilisateur a un solde suffisant
  bool hasEnoughBalance(double amount) => balance >= amount;

  /// Retourne le prénom (premier mot du nom)
  String get firstName => name.split(' ').first;

  /// Retourne les initiales pour l'avatar
  String get initials {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.substring(0, 1).toUpperCase();
  }
}
