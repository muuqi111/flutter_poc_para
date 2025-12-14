import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental.freezed.dart';
part 'rental.g.dart';

enum RentalStatus {
  active,       // En cours
  completed,    // Terminee normalement
  late,         // En retard (>100h avec penalite)
  cancelled,    // Annulee
}

enum RentalType {
  rental,          // Location horaire uniquement
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
    @Default(RentalType.rental) RentalType type,
    @Default(0.0) double basePrice,           // Prix de base
    double? extraCharges,                      // Frais supplémentaires
    @Default(0.0) double totalCost,           // Coût total final
    @Default(false) bool isDamaged,           // Signalé comme abîmé
    String? notes,                            // Notes utilisateur
  }) = _Rental;

  factory Rental.fromJson(Map<String, dynamic> json) =>
      _$RentalFromJson(json);
}

extension RentalExtension on Rental {
  /// Duree de la location en minutes
  int get durationInMinutes {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime).inMinutes;
  }

  /// Duree de la location en heures
  double get durationInHours => durationInMinutes / 60.0;

  /// Duree de la location en heures entieres
  int get durationInHoursInt => (durationInMinutes / 60).floor();

  /// Duree de la location
  Duration get duration {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime);
  }

  /// Duree formatee (ex: "1h 30min")
  String get formattedDuration {
    final hours = durationInMinutes ~/ 60;
    final minutes = durationInMinutes % 60;
    if (hours >= 24) {
      final days = hours ~/ 24;
      final remainingHours = hours % 24;
      return '${days}j ${remainingHours}h ${minutes}min';
    }
    if (hours > 0) {
      return '${hours}h ${minutes}min';
    }
    return '${minutes}min';
  }

  /// Verifie si la location est active
  bool get isActive => status == RentalStatus.active;

  /// Verifie si la location est terminee
  bool get isCompleted => status == RentalStatus.completed;

  /// Verifie si penalite appliquee (>100h)
  bool get hasPenalty => durationInHoursInt >= 100;

  /// Verifie si c'est en retard (plus de 100h)
  bool get isLate => durationInHoursInt >= 100;

  /// Heures restantes avant penalite
  int get hoursUntilPenalty {
    final hours = durationInHoursInt;
    if (hours >= 100) return 0;
    return 100 - hours;
  }

  /// Retourne le texte du statut en francais
  String get statusText {
    switch (status) {
      case RentalStatus.active:
        return 'En cours';
      case RentalStatus.completed:
        return 'Terminee';
      case RentalStatus.late:
        return 'Penalite';
      case RentalStatus.cancelled:
        return 'Annulee';
    }
  }

  /// Retourne la couleur du statut
  Color get statusColor {
    switch (status) {
      case RentalStatus.active:
        return Colors.blue;
      case RentalStatus.completed:
        return Colors.green;
      case RentalStatus.late:
        return Colors.red;
      case RentalStatus.cancelled:
        return Colors.grey;
    }
  }

  /// Retourne le texte du type en francais
  String get typeText {
    return 'Location';
  }
}
