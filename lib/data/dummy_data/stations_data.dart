import '../models/station.dart';
import '../models/umbrella.dart';

/// Donnees mockees pour les bornes de location de parapluies
/// 12 localisations reelles a LIEGE uniquement
final List<Station> dummyStations = [
  // 1. Gare des Guillemins
  Station(
    id: 'station_1',
    name: 'Gare des Guillemins',
    address: 'Place des Guillemins, 4000 Liege',
    latitude: 50.6245,
    longitude: 5.5673,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 15),
    umbrellas: [
      const Umbrella(
        id: 'umb_gui_001',
        stationId: 'station_1',
        color: UmbrellaColor.blue,
        totalRentals: 23,
      ),
      const Umbrella(
        id: 'umb_gui_002',
        stationId: 'station_1',
        color: UmbrellaColor.red,
        totalRentals: 18,
      ),
      const Umbrella(
        id: 'umb_gui_003',
        stationId: 'station_1',
        color: UmbrellaColor.green,
        totalRentals: 31,
      ),
      const Umbrella(
        id: 'umb_gui_004',
        stationId: 'station_1',
        color: UmbrellaColor.black,
        totalRentals: 15,
      ),
      const Umbrella(
        id: 'umb_gui_005',
        stationId: 'station_1',
        color: UmbrellaColor.yellow,
        totalRentals: 8,
      ),
      const Umbrella(
        id: 'umb_gui_006',
        stationId: 'station_1',
        color: UmbrellaColor.blue,
        totalRentals: 42,
      ),
      const Umbrella(
        id: 'umb_gui_007',
        stationId: 'station_1',
        color: UmbrellaColor.red,
        totalRentals: 27,
      ),
    ],
  ),

  // 2. Place Saint-Lambert
  Station(
    id: 'station_2',
    name: 'Place Saint-Lambert',
    address: 'Place Saint-Lambert, 4000 Liege',
    latitude: 50.6403,
    longitude: 5.5738,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 20),
    umbrellas: [
      const Umbrella(
        id: 'umb_stl_001',
        stationId: 'station_2',
        color: UmbrellaColor.blue,
        totalRentals: 56,
      ),
      const Umbrella(
        id: 'umb_stl_002',
        stationId: 'station_2',
        color: UmbrellaColor.green,
        totalRentals: 34,
      ),
      const Umbrella(
        id: 'umb_stl_003',
        stationId: 'station_2',
        color: UmbrellaColor.yellow,
        totalRentals: 19,
      ),
    ],
  ),

  // 3. Gare Centrale (Jonction)
  Station(
    id: 'station_3',
    name: 'Gare Centrale',
    address: 'Place de la Republique Francaise, 4000 Liege',
    latitude: 50.6247,
    longitude: 5.5694,
    totalCapacity: 12,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 22),
    umbrellas: [
      const Umbrella(
        id: 'umb_gc_001',
        stationId: 'station_3',
        color: UmbrellaColor.blue,
        totalRentals: 67,
      ),
      const Umbrella(
        id: 'umb_gc_002',
        stationId: 'station_3',
        color: UmbrellaColor.red,
        totalRentals: 45,
      ),
      const Umbrella(
        id: 'umb_gc_003',
        stationId: 'station_3',
        color: UmbrellaColor.green,
        totalRentals: 38,
      ),
      const Umbrella(
        id: 'umb_gc_004',
        stationId: 'station_3',
        color: UmbrellaColor.black,
        totalRentals: 52,
      ),
      const Umbrella(
        id: 'umb_gc_005',
        stationId: 'station_3',
        color: UmbrellaColor.yellow,
        totalRentals: 29,
      ),
      const Umbrella(
        id: 'umb_gc_006',
        stationId: 'station_3',
        color: UmbrellaColor.blue,
        totalRentals: 41,
      ),
      const Umbrella(
        id: 'umb_gc_007',
        stationId: 'station_3',
        color: UmbrellaColor.red,
        totalRentals: 33,
      ),
      const Umbrella(
        id: 'umb_gc_008',
        stationId: 'station_3',
        color: UmbrellaColor.green,
        totalRentals: 26,
      ),
      const Umbrella(
        id: 'umb_gc_009',
        stationId: 'station_3',
        color: UmbrellaColor.black,
        totalRentals: 18,
      ),
    ],
  ),

  // 4. Place de la Cathedrale
  Station(
    id: 'station_4',
    name: 'Place de la Cathedrale',
    address: 'Place de la Cathedrale, 4000 Liege',
    latitude: 50.6427,
    longitude: 5.5749,
    totalCapacity: 6,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 18),
    umbrellas: [
      const Umbrella(
        id: 'umb_cat_001',
        stationId: 'station_4',
        color: UmbrellaColor.blue,
        totalRentals: 44,
      ),
      const Umbrella(
        id: 'umb_cat_002',
        stationId: 'station_4',
        color: UmbrellaColor.red,
        totalRentals: 37,
      ),
    ],
  ),

  // 5. Parc de la Boverie
  Station(
    id: 'station_5',
    name: 'Parc de la Boverie',
    address: 'Parc de la Boverie, 4020 Liege',
    latitude: 50.6334,
    longitude: 5.5797,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 10),
    umbrellas: [
      const Umbrella(
        id: 'umb_bov_001',
        stationId: 'station_5',
        color: UmbrellaColor.green,
        totalRentals: 28,
      ),
      const Umbrella(
        id: 'umb_bov_002',
        stationId: 'station_5',
        color: UmbrellaColor.blue,
        totalRentals: 35,
      ),
      const Umbrella(
        id: 'umb_bov_003',
        stationId: 'station_5',
        color: UmbrellaColor.yellow,
        totalRentals: 22,
      ),
      const Umbrella(
        id: 'umb_bov_004',
        stationId: 'station_5',
        color: UmbrellaColor.black,
        totalRentals: 41,
      ),
      const Umbrella(
        id: 'umb_bov_005',
        stationId: 'station_5',
        color: UmbrellaColor.red,
        totalRentals: 16,
      ),
    ],
  ),

  // 6. Opera Royal de Wallonie
  Station(
    id: 'station_6',
    name: 'Opera Royal de Wallonie',
    address: 'Rue des Dominicains 1, 4000 Liege',
    latitude: 50.6397,
    longitude: 5.5706,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 25),
    umbrellas: [], // Pas de parapluies disponibles
  ),

  // 7. CHU de Liege
  Station(
    id: 'station_7',
    name: 'CHU de Liege',
    address: "Avenue de l'Hopital, 4000 Liege",
    latitude: 50.6168,
    longitude: 5.5983,
    totalCapacity: 15,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 28),
    umbrellas: [
      const Umbrella(
        id: 'umb_chu_001',
        stationId: 'station_7',
        color: UmbrellaColor.blue,
        totalRentals: 89,
      ),
      const Umbrella(
        id: 'umb_chu_002',
        stationId: 'station_7',
        color: UmbrellaColor.blue,
        totalRentals: 76,
      ),
      const Umbrella(
        id: 'umb_chu_003',
        stationId: 'station_7',
        color: UmbrellaColor.red,
        totalRentals: 62,
      ),
      const Umbrella(
        id: 'umb_chu_004',
        stationId: 'station_7',
        color: UmbrellaColor.green,
        totalRentals: 54,
      ),
      const Umbrella(
        id: 'umb_chu_005',
        stationId: 'station_7',
        color: UmbrellaColor.black,
        totalRentals: 48,
      ),
      const Umbrella(
        id: 'umb_chu_006',
        stationId: 'station_7',
        color: UmbrellaColor.yellow,
        totalRentals: 39,
      ),
      const Umbrella(
        id: 'umb_chu_007',
        stationId: 'station_7',
        color: UmbrellaColor.blue,
        totalRentals: 31,
      ),
      const Umbrella(
        id: 'umb_chu_008',
        stationId: 'station_7',
        color: UmbrellaColor.red,
        totalRentals: 27,
      ),
      const Umbrella(
        id: 'umb_chu_009',
        stationId: 'station_7',
        color: UmbrellaColor.green,
        totalRentals: 22,
      ),
      const Umbrella(
        id: 'umb_chu_010',
        stationId: 'station_7',
        color: UmbrellaColor.black,
        totalRentals: 18,
      ),
      const Umbrella(
        id: 'umb_chu_011',
        stationId: 'station_7',
        color: UmbrellaColor.yellow,
        totalRentals: 14,
      ),
      const Umbrella(
        id: 'umb_chu_012',
        stationId: 'station_7',
        color: UmbrellaColor.blue,
        totalRentals: 9,
      ),
    ],
  ),

  // 8. Universite de Liege - Sart Tilman
  Station(
    id: 'station_8',
    name: 'Universite de Liege - Sart Tilman',
    address: 'Quartier Agora, 4000 Liege',
    latitude: 50.5814,
    longitude: 5.5639,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 12),
    umbrellas: [
      const Umbrella(
        id: 'umb_ulg_001',
        stationId: 'station_8',
        color: UmbrellaColor.red,
        totalRentals: 58,
      ),
      const Umbrella(
        id: 'umb_ulg_002',
        stationId: 'station_8',
        color: UmbrellaColor.blue,
        totalRentals: 47,
      ),
      const Umbrella(
        id: 'umb_ulg_003',
        stationId: 'station_8',
        color: UmbrellaColor.green,
        totalRentals: 39,
      ),
      const Umbrella(
        id: 'umb_ulg_004',
        stationId: 'station_8',
        color: UmbrellaColor.yellow,
        totalRentals: 33,
      ),
      const Umbrella(
        id: 'umb_ulg_005',
        stationId: 'station_8',
        color: UmbrellaColor.black,
        totalRentals: 26,
      ),
      const Umbrella(
        id: 'umb_ulg_006',
        stationId: 'station_8',
        color: UmbrellaColor.blue,
        totalRentals: 21,
      ),
    ],
  ),

  // 9. Mediacite
  Station(
    id: 'station_9',
    name: 'Mediacite',
    address: 'Boulevard Raymond Poincare 7, 4020 Liege',
    latitude: 50.6373,
    longitude: 5.5912,
    totalCapacity: 12,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 30),
    umbrellas: [
      const Umbrella(
        id: 'umb_med_001',
        stationId: 'station_9',
        color: UmbrellaColor.blue,
        totalRentals: 71,
      ),
      const Umbrella(
        id: 'umb_med_002',
        stationId: 'station_9',
        color: UmbrellaColor.red,
        totalRentals: 63,
      ),
      const Umbrella(
        id: 'umb_med_003',
        stationId: 'station_9',
        color: UmbrellaColor.green,
        totalRentals: 55,
      ),
      const Umbrella(
        id: 'umb_med_004',
        stationId: 'station_9',
        color: UmbrellaColor.black,
        totalRentals: 48,
      ),
      const Umbrella(
        id: 'umb_med_005',
        stationId: 'station_9',
        color: UmbrellaColor.yellow,
        totalRentals: 42,
      ),
      const Umbrella(
        id: 'umb_med_006',
        stationId: 'station_9',
        color: UmbrellaColor.blue,
        totalRentals: 36,
      ),
      const Umbrella(
        id: 'umb_med_007',
        stationId: 'station_9',
        color: UmbrellaColor.red,
        totalRentals: 29,
      ),
      const Umbrella(
        id: 'umb_med_008',
        stationId: 'station_9',
        color: UmbrellaColor.green,
        totalRentals: 23,
      ),
    ],
  ),

  // 10. Montagne de Bueren
  Station(
    id: 'station_10',
    name: 'Montagne de Bueren',
    address: 'Montagne de Bueren, 4000 Liege',
    latitude: 50.6478,
    longitude: 5.5809,
    totalCapacity: 6,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 8),
    umbrellas: [
      const Umbrella(
        id: 'umb_bue_001',
        stationId: 'station_10',
        color: UmbrellaColor.blue,
        totalRentals: 82,
      ),
    ],
  ),

  // 11. Grand Curtius
  Station(
    id: 'station_11',
    name: 'Grand Curtius',
    address: 'Feronstree 136, 4000 Liege',
    latitude: 50.6469,
    longitude: 5.5785,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 14),
    umbrellas: [
      const Umbrella(
        id: 'umb_cur_001',
        stationId: 'station_11',
        color: UmbrellaColor.green,
        totalRentals: 49,
      ),
      const Umbrella(
        id: 'umb_cur_002',
        stationId: 'station_11',
        color: UmbrellaColor.blue,
        totalRentals: 41,
      ),
      const Umbrella(
        id: 'umb_cur_003',
        stationId: 'station_11',
        color: UmbrellaColor.red,
        totalRentals: 35,
      ),
      const Umbrella(
        id: 'umb_cur_004',
        stationId: 'station_11',
        color: UmbrellaColor.yellow,
        totalRentals: 28,
      ),
    ],
  ),

  // 12. Cite Miroir
  Station(
    id: 'station_12',
    name: 'Cite Miroir',
    address: 'Place Xavier Neujean 22, 4000 Liege',
    latitude: 50.6431,
    longitude: 5.5685,
    totalCapacity: 10,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 11, 27),
    umbrellas: [
      const Umbrella(
        id: 'umb_cit_001',
        stationId: 'station_12',
        color: UmbrellaColor.black,
        totalRentals: 64,
      ),
      const Umbrella(
        id: 'umb_cit_002',
        stationId: 'station_12',
        color: UmbrellaColor.blue,
        totalRentals: 57,
      ),
      const Umbrella(
        id: 'umb_cit_003',
        stationId: 'station_12',
        color: UmbrellaColor.red,
        totalRentals: 51,
      ),
      const Umbrella(
        id: 'umb_cit_004',
        stationId: 'station_12',
        color: UmbrellaColor.green,
        totalRentals: 44,
      ),
      const Umbrella(
        id: 'umb_cit_005',
        stationId: 'station_12',
        color: UmbrellaColor.yellow,
        totalRentals: 38,
      ),
      const Umbrella(
        id: 'umb_cit_006',
        stationId: 'station_12',
        color: UmbrellaColor.blue,
        totalRentals: 32,
      ),
      const Umbrella(
        id: 'umb_cit_007',
        stationId: 'station_12',
        color: UmbrellaColor.red,
        totalRentals: 25,
      ),
    ],
  ),

  // 13. HELMo Campus Guillemins
  Station(
    id: 'station_helmo',
    name: 'HELMo Campus Guillemins',
    address: 'Rue de Harlez 25, 4000 Liege',
    latitude: 50.6254,
    longitude: 5.5659,
    totalCapacity: 8,
    status: StationStatus.online,
    lastMaintenanceDate: DateTime(2024, 12, 1),
    umbrellas: [
      const Umbrella(
        id: 'umb_helmo_001',
        stationId: 'station_helmo',
        color: UmbrellaColor.blue,
        totalRentals: 12,
      ),
      const Umbrella(
        id: 'umb_helmo_002',
        stationId: 'station_helmo',
        color: UmbrellaColor.red,
        totalRentals: 8,
      ),
      const Umbrella(
        id: 'umb_helmo_003',
        stationId: 'station_helmo',
        color: UmbrellaColor.green,
        totalRentals: 15,
      ),
      const Umbrella(
        id: 'umb_helmo_004',
        stationId: 'station_helmo',
        color: UmbrellaColor.blue,
        totalRentals: 6,
      ),
      const Umbrella(
        id: 'umb_helmo_005',
        stationId: 'station_helmo',
        color: UmbrellaColor.yellow,
        totalRentals: 20,
      ),
      const Umbrella(
        id: 'umb_helmo_006',
        stationId: 'station_helmo',
        status: UmbrellaStatus.inUse,
        color: UmbrellaColor.black,
        totalRentals: 31,
      ),
      const Umbrella(
        id: 'umb_helmo_007',
        stationId: 'station_helmo',
        status: UmbrellaStatus.inUse,
        color: UmbrellaColor.blue,
        totalRentals: 18,
      ),
      const Umbrella(
        id: 'umb_helmo_008',
        stationId: 'station_helmo',
        status: UmbrellaStatus.inUse,
        color: UmbrellaColor.red,
        totalRentals: 25,
      ),
    ],
  ),
];
