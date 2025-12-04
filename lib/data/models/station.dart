import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'umbrella.dart';

part 'station.freezed.dart';
part 'station.g.dart';

enum StationStatus {
  online,
  offline,
  maintenance,
}

@freezed
class Station with _$Station {
  const factory Station({
    required String id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    required int totalCapacity,
    required List<Umbrella> umbrellas,
    @Default(StationStatus.online) StationStatus status,
    DateTime? lastMaintenanceDate,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}

extension StationExtension on Station {
  /// Nombre de parapluies disponibles
  int get availableUmbrellasCount =>
      umbrellas.where((u) => u.status == UmbrellaStatus.available).length;

  /// Nombre d'emplacements libres
  int get freeSlots => totalCapacity - umbrellas.length;

  /// Coordonnées GPS
  LatLng get latLng => LatLng(latitude, longitude);

  /// Vérifie si la borne a des parapluies disponibles
  bool get hasAvailableUmbrellas => availableUmbrellasCount > 0;

  /// Vérifie si la borne a des emplacements libres
  bool get hasFreeSlots => freeSlots > 0;

  /// Retourne le texte du statut en français
  String get statusText {
    switch (status) {
      case StationStatus.online:
        return 'En ligne';
      case StationStatus.offline:
        return 'Hors ligne';
      case StationStatus.maintenance:
        return 'En maintenance';
    }
  }
}
