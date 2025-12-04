import '../models/rental.dart';

/// Historique des locations mockées pour la démo
final List<Rental> dummyRentals = [
  // Location terminée - il y a 1 semaine
  Rental(
    id: 'rental_001',
    userId: 'user_001',
    umbrellaId: 'umb_lg1_5',
    startStationId: 'station_liege_1',
    startStationName: 'Gare des Guillemins',
    endStationId: 'station_liege_2',
    endStationName: 'Place Saint-Lambert',
    startTime: DateTime.now().subtract(const Duration(days: 7, hours: 2)),
    endTime: DateTime.now().subtract(const Duration(days: 7, hours: 1, minutes: 15)),
    status: RentalStatus.completed,
    totalCost: 0.95, // 0.50€ unlock + 0.15€ x 3 (45min)
  ),

  // Location terminée - il y a 5 jours
  Rental(
    id: 'rental_002',
    userId: 'user_001',
    umbrellaId: 'umb_lg2_3',
    startStationId: 'station_liege_2',
    startStationName: 'Place Saint-Lambert',
    endStationId: 'station_liege_3',
    endStationName: 'Parc de la Boverie',
    startTime: DateTime.now().subtract(const Duration(days: 5, hours: 3)),
    endTime: DateTime.now().subtract(const Duration(days: 5, hours: 1, minutes: 45)),
    status: RentalStatus.completed,
    totalCost: 1.25, // 0.50€ unlock + 0.15€ x 5 (75min)
  ),

  // Location terminée - il y a 3 jours
  Rental(
    id: 'rental_003',
    userId: 'user_001',
    umbrellaId: 'umb_bru1_2',
    startStationId: 'station_brussels_1',
    startStationName: 'Gare Centrale',
    endStationId: 'station_brussels_2',
    endStationName: 'Grand Place',
    startTime: DateTime.now().subtract(const Duration(days: 3, hours: 4)),
    endTime: DateTime.now().subtract(const Duration(days: 3, hours: 3, minutes: 30)),
    status: RentalStatus.completed,
    totalCost: 0.80, // 0.50€ unlock + 0.15€ x 2 (30min)
  ),

  // Location terminée - il y a 2 jours (longue durée)
  Rental(
    id: 'rental_004',
    userId: 'user_001',
    umbrellaId: 'umb_lg5_3',
    startStationId: 'station_liege_5',
    startStationName: 'Université de Liège',
    endStationId: 'station_liege_1',
    endStationName: 'Gare des Guillemins',
    startTime: DateTime.now().subtract(const Duration(days: 2, hours: 6)),
    endTime: DateTime.now().subtract(const Duration(days: 2, hours: 3, minutes: 20)),
    status: RentalStatus.completed,
    totalCost: 3.50, // 0.50€ unlock + 0.15€ x 20 (2h40min = 160min)
  ),

  // Location terminée - hier
  Rental(
    id: 'rental_005',
    userId: 'user_001',
    umbrellaId: 'umb_lg3_2',
    startStationId: 'station_liege_3',
    startStationName: 'Parc de la Boverie',
    endStationId: 'station_liege_2',
    endStationName: 'Place Saint-Lambert',
    startTime: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    endTime: DateTime.now().subtract(const Duration(days: 1, hours: 1, minutes: 35)),
    status: RentalStatus.completed,
    totalCost: 0.95, // 0.50€ unlock + 0.15€ x 3 (35min)
  ),

  // Location terminée - aujourd'hui matin
  Rental(
    id: 'rental_006',
    userId: 'user_001',
    umbrellaId: 'umb_bru2_1',
    startStationId: 'station_brussels_2',
    startStationName: 'Grand Place',
    endStationId: 'station_brussels_3',
    endStationName: 'Parc du Cinquantenaire',
    startTime: DateTime.now().subtract(const Duration(hours: 6)),
    endTime: DateTime.now().subtract(const Duration(hours: 5, minutes: 20)),
    status: RentalStatus.completed,
    totalCost: 0.95, // 0.50€ unlock + 0.15€ x 3 (40min)
  ),

  // Location annulée - il y a 10 jours
  Rental(
    id: 'rental_007',
    userId: 'user_001',
    umbrellaId: 'umb_lg1_1',
    startStationId: 'station_liege_1',
    startStationName: 'Gare des Guillemins',
    startTime: DateTime.now().subtract(const Duration(days: 10, hours: 1)),
    endTime: DateTime.now().subtract(const Duration(days: 10, hours: 1, minutes: 5)),
    status: RentalStatus.cancelled,
    totalCost: 0.50, // Seulement frais de déverrouillage
  ),
];
