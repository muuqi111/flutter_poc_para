import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/rental.dart';
import '../../../data/dummy_data/rentals_data.dart';

/// Provider pour l'historique des locations
final rentalHistoryProvider = StateProvider<List<Rental>>((ref) {
  return dummyRentals;
});

/// Provider pour le nombre total de locations
final totalRentalsCountProvider = Provider<int>((ref) {
  final rentals = ref.watch(rentalHistoryProvider);
  return rentals.length;
});

/// Provider pour les locations complétées
final completedRentalsProvider = Provider<List<Rental>>((ref) {
  final rentals = ref.watch(rentalHistoryProvider);
  return rentals.where((r) => r.status == RentalStatus.completed).toList();
});

/// Provider pour le coût total des locations
final totalRentalCostProvider = Provider<double>((ref) {
  final rentals = ref.watch(completedRentalsProvider);
  return rentals.fold(0.0, (sum, rental) => sum + rental.totalCost);
});
