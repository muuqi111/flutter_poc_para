import '../models/station.dart';
import '../models/umbrella.dart';

/// Données mockées pour les bornes de location de parapluies
/// 12 localisations réelles à LIÈGE uniquement
final List<Station> dummyStations = [
  // 1. Gare des Guillemins
  Station(
    id: 'station_1',
    name: 'Gare des Guillemins',
    address: 'Place des Guillemins, 4000 Liège',
    latitude: 50.6245,
    longitude: 5.5673,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 15),
    umbrellas: [
      const Umbrella(id: 'umb_1_1', stationId: 'station_1'),
      const Umbrella(id: 'umb_1_2', stationId: 'station_1'),
      const Umbrella(id: 'umb_1_3', stationId: 'station_1'),
      const Umbrella(id: 'umb_1_4', stationId: 'station_1'),
      const Umbrella(id: 'umb_1_5', stationId: 'station_1'),
      const Umbrella(id: 'umb_1_6', stationId: 'station_1'),
      const Umbrella(id: 'umb_1_7', stationId: 'station_1'),
    ],
  ),

  // 2. Place Saint-Lambert
  Station(
    id: 'station_2',
    name: 'Place Saint-Lambert',
    address: 'Place Saint-Lambert, 4000 Liège',
    latitude: 50.6403,
    longitude: 5.5738,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 20),
    umbrellas: [
      const Umbrella(id: 'umb_2_1', stationId: 'station_2'),
      const Umbrella(id: 'umb_2_2', stationId: 'station_2'),
      const Umbrella(id: 'umb_2_3', stationId: 'station_2'),
    ],
  ),

  // 3. Gare Centrale (Jonction)
  Station(
    id: 'station_3',
    name: 'Gare Centrale',
    address: 'Place de la République Française, 4000 Liège',
    latitude: 50.6247,
    longitude: 5.5694,
    totalCapacity: 12,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 22),
    umbrellas: [
      const Umbrella(id: 'umb_3_1', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_2', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_3', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_4', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_5', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_6', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_7', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_8', stationId: 'station_3'),
      const Umbrella(id: 'umb_3_9', stationId: 'station_3'),
    ],
  ),

  // 4. Place de la Cathédrale
  Station(
    id: 'station_4',
    name: 'Place de la Cathédrale',
    address: 'Place de la Cathédrale, 4000 Liège',
    latitude: 50.6427,
    longitude: 5.5749,
    totalCapacity: 6,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 18),
    umbrellas: [
      const Umbrella(id: 'umb_4_1', stationId: 'station_4'),
      const Umbrella(id: 'umb_4_2', stationId: 'station_4'),
    ],
  ),

  // 5. Parc de la Boverie
  Station(
    id: 'station_5',
    name: 'Parc de la Boverie',
    address: 'Parc de la Boverie, 4020 Liège',
    latitude: 50.6334,
    longitude: 5.5797,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 10),
    umbrellas: [
      const Umbrella(id: 'umb_5_1', stationId: 'station_5'),
      const Umbrella(id: 'umb_5_2', stationId: 'station_5'),
      const Umbrella(id: 'umb_5_3', stationId: 'station_5'),
      const Umbrella(id: 'umb_5_4', stationId: 'station_5'),
      const Umbrella(id: 'umb_5_5', stationId: 'station_5'),
    ],
  ),

  // 6. Opéra Royal de Wallonie
  Station(
    id: 'station_6',
    name: 'Opéra Royal de Wallonie',
    address: 'Rue des Dominicains 1, 4000 Liège',
    latitude: 50.6397,
    longitude: 5.5706,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 25),
    umbrellas: [],
  ),

  // 7. CHU de Liège
  Station(
    id: 'station_7',
    name: 'CHU de Liège',
    address: 'Avenue de l\'Hôpital, 4000 Liège',
    latitude: 50.6168,
    longitude: 5.5983,
    totalCapacity: 15,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 28),
    umbrellas: [
      const Umbrella(id: 'umb_7_1', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_2', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_3', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_4', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_5', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_6', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_7', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_8', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_9', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_10', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_11', stationId: 'station_7'),
      const Umbrella(id: 'umb_7_12', stationId: 'station_7'),
    ],
  ),

  // 8. Université de Liège - Sart Tilman
  Station(
    id: 'station_8',
    name: 'Université de Liège - Sart Tilman',
    address: 'Quartier Agora, 4000 Liège',
    latitude: 50.5814,
    longitude: 5.5639,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 12),
    umbrellas: [
      const Umbrella(id: 'umb_8_1', stationId: 'station_8'),
      const Umbrella(id: 'umb_8_2', stationId: 'station_8'),
      const Umbrella(id: 'umb_8_3', stationId: 'station_8'),
      const Umbrella(id: 'umb_8_4', stationId: 'station_8'),
      const Umbrella(id: 'umb_8_5', stationId: 'station_8'),
      const Umbrella(id: 'umb_8_6', stationId: 'station_8'),
    ],
  ),

  // 9. Médiacité
  Station(
    id: 'station_9',
    name: 'Médiacité',
    address: 'Boulevard Raymond Poincaré 7, 4020 Liège',
    latitude: 50.6373,
    longitude: 5.5912,
    totalCapacity: 12,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 30),
    umbrellas: [
      const Umbrella(id: 'umb_9_1', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_2', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_3', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_4', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_5', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_6', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_7', stationId: 'station_9'),
      const Umbrella(id: 'umb_9_8', stationId: 'station_9'),
    ],
  ),

  // 10. Montagne de Bueren
  Station(
    id: 'station_10',
    name: 'Montagne de Bueren',
    address: 'Montagne de Bueren, 4000 Liège',
    latitude: 50.6478,
    longitude: 5.5809,
    totalCapacity: 6,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 8),
    umbrellas: [
      const Umbrella(id: 'umb_10_1', stationId: 'station_10'),
    ],
  ),

  // 11. Grand Curtius
  Station(
    id: 'station_11',
    name: 'Grand Curtius',
    address: 'Féronstrée 136, 4000 Liège',
    latitude: 50.6469,
    longitude: 5.5785,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 14),
    umbrellas: [
      const Umbrella(id: 'umb_11_1', stationId: 'station_11'),
      const Umbrella(id: 'umb_11_2', stationId: 'station_11'),
      const Umbrella(id: 'umb_11_3', stationId: 'station_11'),
      const Umbrella(id: 'umb_11_4', stationId: 'station_11'),
    ],
  ),

  // 12. Cité Miroir
  Station(
    id: 'station_12',
    name: 'Cité Miroir',
    address: 'Place Xavier Neujean 22, 4000 Liège',
    latitude: 50.6431,
    longitude: 5.5685,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 27),
    umbrellas: [
      const Umbrella(id: 'umb_12_1', stationId: 'station_12'),
      const Umbrella(id: 'umb_12_2', stationId: 'station_12'),
      const Umbrella(id: 'umb_12_3', stationId: 'station_12'),
      const Umbrella(id: 'umb_12_4', stationId: 'station_12'),
      const Umbrella(id: 'umb_12_5', stationId: 'station_12'),
      const Umbrella(id: 'umb_12_6', stationId: 'station_12'),
      const Umbrella(id: 'umb_12_7', stationId: 'station_12'),
    ],
  ),
];
