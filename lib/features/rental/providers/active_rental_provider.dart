import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/rental.dart';
import '../../../data/models/station.dart';
import '../../../data/models/umbrella.dart';
import '../../../core/config/constants.dart';

/// Provider pour la location active
final activeRentalProvider =
    StateNotifierProvider<ActiveRentalNotifier, Rental?>((ref) {
      return ActiveRentalNotifier();
    });

class ActiveRentalNotifier extends StateNotifier<Rental?> {
  ActiveRentalNotifier() : super(null);

  /// Demarre une nouvelle location (toujours horaire)
  /// Minimum 0.20 EUR des l'activation (1ere heure)
  void startRental({
    required String oderId,
    required String userId,
    required Umbrella umbrella,
    required Station station,
    required RentalType type,
  }) {
    state = Rental(
      id: oderId,
      userId: userId,
      umbrellaId: umbrella.id,
      startStationId: station.id,
      startStationName: station.name,
      startTime: DateTime.now(),
      status: RentalStatus.active,
      type: RentalType.rental, // Toujours location
      basePrice: AppConstants.hourlyRate,
      totalCost: AppConstants.hourlyRate, // 0.20 EUR des l'activation
    );
  }

  /// Termine la location
  void completeRental({
    required Station endStation,
    double? extraCharges,
    bool isDamaged = false,
    String? notes,
  }) {
    if (state == null) return;

    final endTime = DateTime.now();
    final totalCost = _calculateTotalCost(state!, endTime, extraCharges);
    final hours = endTime.difference(state!.startTime).inHours;

    state = state!.copyWith(
      endStationId: endStation.id,
      endStationName: endStation.name,
      endTime: endTime,
      status: hours >= AppConstants.maxRentalHours
          ? RentalStatus.late
          : RentalStatus.completed,
      extraCharges: extraCharges,
      totalCost: totalCost,
      isDamaged: isDamaged,
      notes: notes,
    );
  }

  /// Calcule le cout total selon le modele horaire
  double _calculateTotalCost(
    Rental rental,
    DateTime endTime,
    double? extraCharges,
  ) {
    final duration = endTime.difference(rental.startTime);
    final hours = duration.inHours;

    double total;
    if (hours >= AppConstants.maxRentalHours) {
      // 100h x 0,20EUR + 35EUR penalite
      total = (AppConstants.maxRentalHours * AppConstants.hourlyRate) +
          AppConstants.penaltyFee;
    } else {
      total = hours * AppConstants.hourlyRate;
    }

    // Frais supplementaires (dommages)
    if (extraCharges != null) {
      total += extraCharges;
    }

    return total;
  }

  /// Annule la location
  void cancelRental() {
    if (state == null) return;

    state = state!.copyWith(
      endTime: DateTime.now(),
      status: RentalStatus.cancelled,
      totalCost: 0.0,
    );
  }

  /// Termine la location (pour le bouton fermer)
  void endRental() {
    state = null;
  }

  /// Recupere la location terminee et reinitialise l'etat
  Rental? getCompletedRentalAndClear() {
    final completedRental = state;
    state = null;
    return completedRental;
  }

  /// Reinitialise la location active
  void clearRental() {
    state = null;
  }
}

/// Provider pour calculer le cout actuel de la location en cours
/// Minimum 0.20 EUR des l'activation (1ere heure entamee = payee)
final currentRentalCostProvider = Provider<double>((ref) {
  final rental = ref.watch(activeRentalProvider);
  if (rental == null) return 0.0;

  final duration = DateTime.now().difference(rental.startTime);
  final hours = duration.inHours;

  if (hours >= AppConstants.maxRentalHours) {
    return (AppConstants.maxRentalHours * AppConstants.hourlyRate) +
        AppConstants.penaltyFee;
  }

  // Minimum 1 heure (0.20 EUR) des l'activation
  final billableHours = hours < 1 ? 1 : hours + 1; // heure entamee = payee
  return billableHours * AppConstants.hourlyRate;
});

/// Provider pour verifier si une location est en retard (>100h)
final isRentalLateProvider = Provider<bool>((ref) {
  final rental = ref.watch(activeRentalProvider);
  if (rental == null) return false;

  final duration = DateTime.now().difference(rental.startTime);
  return duration.inHours >= AppConstants.maxRentalHours;
});

/// Provider pour la duree ecoulee
final rentalDurationProvider = Provider<Duration>((ref) {
  final rental = ref.watch(activeRentalProvider);
  if (rental == null) return Duration.zero;

  return DateTime.now().difference(rental.startTime);
});

/// Provider pour les heures restantes avant penalite
final hoursUntilPenaltyProvider = Provider<int>((ref) {
  final rental = ref.watch(activeRentalProvider);
  if (rental == null) return AppConstants.maxRentalHours;

  final duration = DateTime.now().difference(rental.startTime);
  final hours = duration.inHours;

  if (hours >= AppConstants.maxRentalHours) return 0;
  return AppConstants.maxRentalHours - hours;
});
