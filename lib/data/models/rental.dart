import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental.freezed.dart';
part 'rental.g.dart';

enum RentalStatus {
  active, // En cours
  completed, // Terminée
  cancelled, // Annulée
}

@freezed
class Rental with _$Rental {
  const factory Rental({
    required String id,
    required String userId,
    required String umbrellaId,
    required String startStationId,
    required String startStationName,
    String? endStationId,
    String? endStationName,
    required DateTime startTime,
    DateTime? endTime,
    @Default(RentalStatus.active) RentalStatus status,
    @Default(0.0) double totalCost,
  }) = _Rental;

  factory Rental.fromJson(Map<String, dynamic> json) =>
      _$RentalFromJson(json);
}

extension RentalExtension on Rental {
  /// Durée de la location en minutes
  int get durationInMinutes {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime).inMinutes;
  }

  /// Durée de la location en heures
  double get durationInHours => durationInMinutes / 60.0;

  /// Durée formatée (ex: "1h 30min")
  String get formattedDuration {
    final hours = durationInMinutes ~/ 60;
    final minutes = durationInMinutes % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}min';
    }
    return '${minutes}min';
  }

  /// Vérifie si la location est active
  bool get isActive => status == RentalStatus.active;

  /// Vérifie si la location est terminée
  bool get isCompleted => status == RentalStatus.completed;

  /// Retourne le texte du statut en français
  String get statusText {
    switch (status) {
      case RentalStatus.active:
        return 'En cours';
      case RentalStatus.completed:
        return 'Terminée';
      case RentalStatus.cancelled:
        return 'Annulée';
    }
  }
}
