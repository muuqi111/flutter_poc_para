import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/rental.dart';
import '../../../data/dummy_data/rentals_data.dart';

/// Provider pour l'historique des locations avec StateNotifier
final rentalHistoryProvider =
    StateNotifierProvider<RentalHistoryNotifier, List<Rental>>((ref) {
  return RentalHistoryNotifier();
});

class RentalHistoryNotifier extends StateNotifier<List<Rental>> {
  RentalHistoryNotifier() : super(dummyRentals);

  /// Ajoute une nouvelle location a l'historique
  void addRental(Rental rental) {
    state = [rental, ...state];
  }

  /// Met a jour une location existante
  void updateRental(Rental rental) {
    state = [
      for (final r in state)
        if (r.id == rental.id) rental else r
    ];
  }

  /// Supprime une location de l'historique
  void removeRental(String rentalId) {
    state = state.where((r) => r.id != rentalId).toList();
  }

  /// Efface tout l'historique
  void clearHistory() {
    state = [];
  }
}

/// Provider pour le nombre total de locations
final totalRentalsCountProvider = Provider<int>((ref) {
  final rentals = ref.watch(rentalHistoryProvider);
  return rentals.length;
});

/// Provider pour les locations completees
final completedRentalsProvider = Provider<List<Rental>>((ref) {
  final rentals = ref.watch(rentalHistoryProvider);
  return rentals
      .where((r) =>
          r.status == RentalStatus.completed ||
          r.status == RentalStatus.late)
      .toList();
});

/// Provider pour les locations avec penalite
final lateRentalsProvider = Provider<List<Rental>>((ref) {
  final rentals = ref.watch(rentalHistoryProvider);
  return rentals.where((r) => r.status == RentalStatus.late).toList();
});

/// Provider pour le cout total des locations
final totalRentalCostProvider = Provider<double>((ref) {
  final rentals = ref.watch(completedRentalsProvider);
  return rentals.fold(0.0, (sum, rental) => sum + rental.totalCost);
});

/// Provider pour le nombre de locations actives
final activeRentalsCountProvider = Provider<int>((ref) {
  final rentals = ref.watch(rentalHistoryProvider);
  return rentals.where((r) => r.status == RentalStatus.active).length;
});
