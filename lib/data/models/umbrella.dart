import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'umbrella.freezed.dart';
part 'umbrella.g.dart';

enum UmbrellaStatus {
  available,    // Disponible à la location
  reserved,     // Réservé (pas encore pris)
  inUse,        // En cours d'utilisation
  returning,    // En cours de retour
  maintenance,  // En maintenance
  broken,       // Cassé
}

enum UmbrellaColor {
  blue,
  red,
  green,
  black,
  yellow,
}

@freezed
class Umbrella with _$Umbrella {
  const factory Umbrella({
    required String id,
    required String stationId,
    @Default(UmbrellaStatus.available) UmbrellaStatus status,
    @Default(UmbrellaColor.blue) UmbrellaColor color,
    @Default(0) int totalRentals,           // Nombre de locations effectuees
    DateTime? lastMaintenanceDate,
    @Default(false) bool needsRepair,
  }) = _Umbrella;

  factory Umbrella.fromJson(Map<String, dynamic> json) =>
      _$UmbrellaFromJson(json);
}

extension UmbrellaExtension on Umbrella {
  /// Vérifie si le parapluie est disponible à la location
  bool get isAvailable => status == UmbrellaStatus.available;

  /// Retourne le texte du statut en français
  String get statusText {
    switch (status) {
      case UmbrellaStatus.available:
        return 'Disponible';
      case UmbrellaStatus.reserved:
        return 'Réservé';
      case UmbrellaStatus.inUse:
        return 'En utilisation';
      case UmbrellaStatus.returning:
        return 'En retour';
      case UmbrellaStatus.maintenance:
        return 'En maintenance';
      case UmbrellaStatus.broken:
        return 'Cassé';
    }
  }

  /// Retourne la couleur Flutter correspondante
  Color get colorValue {
    switch (color) {
      case UmbrellaColor.blue:
        return Colors.blue;
      case UmbrellaColor.red:
        return Colors.red;
      case UmbrellaColor.green:
        return Colors.green;
      case UmbrellaColor.black:
        return Colors.grey.shade800;
      case UmbrellaColor.yellow:
        return Colors.amber;
    }
  }

  /// Retourne le nom de la couleur en français
  String get colorName {
    switch (color) {
      case UmbrellaColor.blue:
        return 'Bleu';
      case UmbrellaColor.red:
        return 'Rouge';
      case UmbrellaColor.green:
        return 'Vert';
      case UmbrellaColor.black:
        return 'Noir';
      case UmbrellaColor.yellow:
        return 'Jaune';
    }
  }

  /// Retourne l'ID court (3 derniers caractères)
  String get shortId => id.length > 3 ? id.substring(id.length - 3) : id;
}
