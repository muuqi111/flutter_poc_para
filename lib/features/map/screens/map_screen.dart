import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/config/app_colors.dart';
import '../providers/stations_provider.dart';
import '../../../data/models/station.dart';
import '../widgets/station_details_bottom_sheet.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();
  bool _showOnlyAvailable = false;
  bool _isMapView = true;

  static const LatLng _liegeCenter = LatLng(50.6245, 5.5673);

  @override
  Widget build(BuildContext context) {
    final allStations = ref.watch(stationsProvider);
    final stations = _showOnlyAvailable
        ? allStations.where((s) => s.hasAvailableUmbrellas).toList()
        : allStations;

    // Compter le nombre total de parapluies disponibles
    final totalUmbrellas = stations.fold<int>(
      0,
      (sum, station) => sum + station.availableUmbrellasCount,
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Carte des bornes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${stations.length} bornes - $totalUmbrellas parapluies disponibles',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).appBarTheme.foregroundColor?.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              _showOnlyAvailable ? Icons.filter_alt : Icons.filter_alt_outlined,
            ),
            tooltip: 'Filtrer les bornes',
            onPressed: () {
              setState(() => _showOnlyAvailable = !_showOnlyAvailable);
            },
          ),
          IconButton(
            icon: Icon(_isMapView ? Icons.list : Icons.map),
            tooltip: _isMapView ? 'Voir en liste' : 'Voir sur la carte',
            onPressed: () {
              setState(() => _isMapView = !_isMapView);
            },
          ),
        ],
      ),

      body: _isMapView ? _buildMapView(stations) : _buildListView(stations),

      floatingActionButton: _isMapView
          ? FloatingActionButton(
              onPressed: () {
                _mapController.move(_liegeCenter, 13.5);
              },
              child: const Icon(Icons.my_location),
            )
          : null,
    );
  }

  Widget _buildMapView(List<Station> stations) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _liegeCenter,
            initialZoom: 13.5,
            minZoom: 11.0,
            maxZoom: 18.0,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.parapp.umbrella',
            ),

            CircleLayer(
              circles: [
                CircleMarker(
                  point: _liegeCenter,
                  color: Colors.blue.withValues(alpha: 0.3),
                  borderColor: Colors.blue,
                  borderStrokeWidth: 3,
                  radius: 15,
                ),
              ],
            ),

            MarkerLayer(
              markers: stations.map((station) {
                return Marker(
                  point: station.latLng,
                  width: 80,
                  height: 80,
                  child: GestureDetector(
                    onTap: () => _showStationDetails(station),
                    child: _buildMarker(station),
                  ),
                );
              }).toList(),
            ),
          ],
        ),

        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                '${stations.length} borne${stations.length > 1 ? 's' : ''} trouvée${stations.length > 1 ? 's' : ''}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMarker(Station station) {
    final available = station.availableUmbrellasCount;
    Color markerColor;
    if (station.status != StationStatus.online) {
      markerColor = Colors.grey;
    } else if (available >= 5) {
      markerColor = AppColors.success;
    } else if (available > 0) {
      markerColor = AppColors.warning;
    } else {
      markerColor = AppColors.error;
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: markerColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.umbrella, color: Colors.white, size: 30),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: markerColor, width: 2),
            ),
            child: Text(
              '$available',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: markerColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListView(List<Station> stations) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: stations.length,
      itemBuilder: (context, index) {
        final station = stations[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(
              Icons.umbrella,
              color: station.hasAvailableUmbrellas
                  ? AppColors.success
                  : AppColors.error,
              size: 32,
            ),
            title: Text(station.name),
            subtitle: Text(station.address),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${station.availableUmbrellasCount}/${station.totalCapacity}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('disponibles', style: TextStyle(fontSize: 10)),
              ],
            ),
            onTap: () => _showStationDetails(station),
          ),
        );
      },
    );
  }

  void _showStationDetails(Station station) {
    showStationDetailsBottomSheet(context, station);
  }
}
