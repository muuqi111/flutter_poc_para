import 'package:freezed_annotation/freezed_annotation.dart';

part 'umbrella.freezed.dart';
part 'umbrella.g.dart';

enum UmbrellaStatus {
  available, // Disponible à la location
  rented, // En cours de location
  broken, // En panne
  charging, // En charge (si IoT)
}

@freezed
class Umbrella with _$Umbrella {
  const factory Umbrella({
    required String id,
    required String stationId,
    @Default(UmbrellaStatus.available) UmbrellaStatus status,
    DateTime? lastMaintenanceDate,
    @Default(100) int batteryLevel, // Niveau de batterie (0-100) - optionnel IoT
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
      case UmbrellaStatus.rented:
        return 'Loué';
      case UmbrellaStatus.broken:
        return 'En panne';
      case UmbrellaStatus.charging:
        return 'En charge';
    }
  }
}
