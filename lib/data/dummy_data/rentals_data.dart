import '../models/rental.dart';

/// Historique des locations mockees pour la demo
/// Nouveau modele : 0,20EUR/h, max 100h, puis penalite de 35EUR
final List<Rental> dummyRentals = [
  // Location normale 3h - il y a 3 jours
  Rental(
    id: 'rental_001',
    userId: 'user_001',
    umbrellaId: 'umb_gui_001',
    startStationId: 'station_1',
    startStationName: 'Gare des Guillemins',
    endStationId: 'station_3',
    endStationName: 'Gare Centrale',
    startTime: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
    endTime: DateTime.now().subtract(const Duration(days: 3, hours: 2)),
    status: RentalStatus.completed,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 0.60, // 3h x 0,20EUR
  ),

  // Location 10h - il y a 5 jours
  Rental(
    id: 'rental_002',
    userId: 'user_001',
    umbrellaId: 'umb_stl_002',
    startStationId: 'station_2',
    startStationName: 'Place Saint-Lambert',
    endStationId: 'station_5',
    endStationName: 'Parc de la Boverie',
    startTime: DateTime.now().subtract(const Duration(days: 5, hours: 14)),
    endTime: DateTime.now().subtract(const Duration(days: 5, hours: 4)),
    status: RentalStatus.completed,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 2.00, // 10h x 0,20EUR
  ),

  // Location 48h - il y a 10 jours
  Rental(
    id: 'rental_003',
    userId: 'user_001',
    umbrellaId: 'umb_gc_003',
    startStationId: 'station_3',
    startStationName: 'Gare Centrale',
    endStationId: 'station_2',
    endStationName: 'Place Saint-Lambert',
    startTime: DateTime.now().subtract(const Duration(days: 12)),
    endTime: DateTime.now().subtract(const Duration(days: 10)),
    status: RentalStatus.completed,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 9.60, // 48h x 0,20EUR
    notes: 'Location de 2 jours',
  ),

  // Location avec penalite (>100h) - il y a 20 jours
  Rental(
    id: 'rental_004',
    userId: 'user_001',
    umbrellaId: 'umb_chu_007',
    startStationId: 'station_7',
    startStationName: 'CHU de Liege',
    endStationId: 'station_helmo',
    endStationName: 'HELMo Campus Guillemins',
    startTime: DateTime.now().subtract(const Duration(days: 25)),
    endTime: DateTime.now().subtract(const Duration(days: 20, hours: 12)),
    status: RentalStatus.late,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 55.00, // 100h x 0,20EUR + 35EUR penalite
    notes: 'Penalite appliquee (>100h)',
  ),

  // Location normale 1h - il y a 1 semaine
  Rental(
    id: 'rental_005',
    userId: 'user_001',
    umbrellaId: 'umb_ulg_003',
    startStationId: 'station_8',
    startStationName: 'Universite de Liege - Sart Tilman',
    endStationId: 'station_8',
    endStationName: 'Universite de Liege - Sart Tilman',
    startTime: DateTime.now().subtract(const Duration(days: 8, hours: 3)),
    endTime: DateTime.now().subtract(const Duration(days: 8, hours: 2)),
    status: RentalStatus.completed,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 0.20, // 1h x 0,20EUR
  ),

  // Location annulee - il y a 12 jours
  Rental(
    id: 'rental_006',
    userId: 'user_001',
    umbrellaId: 'umb_cur_001',
    startStationId: 'station_11',
    startStationName: 'Grand Curtius',
    startTime: DateTime.now().subtract(const Duration(days: 12)),
    endTime: DateTime.now().subtract(const Duration(days: 12)),
    status: RentalStatus.cancelled,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 0.00,
    notes: 'Annulee par l\'utilisateur',
  ),

  // Location 24h - il y a 2 jours
  Rental(
    id: 'rental_007',
    userId: 'user_001',
    umbrellaId: 'umb_med_002',
    startStationId: 'station_9',
    startStationName: 'Mediacite',
    endStationId: 'station_1',
    endStationName: 'Gare des Guillemins',
    startTime: DateTime.now().subtract(const Duration(days: 3)),
    endTime: DateTime.now().subtract(const Duration(days: 2)),
    status: RentalStatus.completed,
    type: RentalType.rental,
    basePrice: 0.20,
    totalCost: 4.80, // 24h x 0,20EUR
  ),
];
