import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/station.dart';
import '../../../data/dummy_data/stations_data.dart';

/// Provider pour toutes les stations
final stationsProvider = StateProvider<List<Station>>((ref) {
  return dummyStations;
});

/// Provider pour les stations disponibles uniquement
final availableStationsProvider = Provider<List<Station>>((ref) {
  final stations = ref.watch(stationsProvider);
  return stations.where((s) => s.hasAvailableUmbrellas).toList();
});

/// Provider pour le nombre total de stations
final stationsCountProvider = Provider<int>((ref) {
  final stations = ref.watch(stationsProvider);
  return stations.length;
});
