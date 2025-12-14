import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/config/constants.dart';
import '../../../data/models/station.dart';
import '../../../data/models/umbrella.dart';
import '../../../data/models/rental.dart';
import '../../rental/screens/qr_scanner_screen.dart';
import 'umbrella_list_item.dart';

class StationDetailsBottomSheet extends ConsumerWidget {
  final Station station;

  const StationDetailsBottomSheet({
    super.key,
    required this.station,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableUmbrellas = station.umbrellas
        .where((u) => u.status == UmbrellaStatus.available)
        .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header avec titre clair
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.cyan.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.location_on, color: AppColors.cyan, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            station.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            station.address,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: availableUmbrellas.isNotEmpty
                            ? AppColors.success.withValues(alpha: 0.1)
                            : Colors.red.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${availableUmbrellas.length}',
                        style: TextStyle(
                          color: availableUmbrellas.isNotEmpty
                              ? AppColors.success
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Distance
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.directions_walk, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      'A 250m - 3 min a pied',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              const Divider(),

              // Stats rapides - SANS "En charge"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatChip(
                      icon: Icons.umbrella,
                      label: 'Disponibles',
                      value: '${availableUmbrellas.length}/${station.totalCapacity}',
                      color: AppColors.success,
                    ),
                    _buildStatChip(
                      icon: Icons.check_circle,
                      label: 'Statut',
                      value: station.status == StationStatus.online ? 'En ligne' : 'Hors ligne',
                      color: station.status == StationStatus.online
                          ? AppColors.success
                          : Colors.red,
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Tarification
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.cyan.withValues(alpha: 0.1),
                      Colors.blue.withValues(alpha: 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.cyan.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.cyan.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.euro, color: AppColors.cyan, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tarif location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                          Text(
                            '${AppConstants.hourlyRate.toStringAsFixed(2)} EUR/heure',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.cyan,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${AppConstants.hourlyRate.toStringAsFixed(2)} EUR',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Liste des parapluies disponibles
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'Parapluies disponibles',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    if (availableUmbrellas.isEmpty)
                      _buildEmptyState()
                    else
                      ...availableUmbrellas.map((umbrella) => UmbrellaListItem(
                            umbrella: umbrella,
                            onSelect: () => _selectUmbrella(context, ref, umbrella),
                          )),
                  ],
                ),
              ),

              // Boutons d'action
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: availableUmbrellas.isNotEmpty
                            ? () => _showUmbrellaSelection(context, ref)
                            : null,
                        icon: const Icon(Icons.qr_code_scanner),
                        label: const Text('Choisir un parapluie'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Ouvrir Google Maps
                        },
                        icon: const Icon(Icons.directions),
                        label: const Text('Itineraire'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.umbrella_outlined,
            size: 60,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun parapluie disponible',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Revenez plus tard ou essayez une autre borne',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _selectUmbrella(BuildContext context, WidgetRef ref, Umbrella umbrella) {
    Navigator.pop(context);
    // Aller directement au scanner QR - pas de choix location/achat
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QRScannerScreen(
          station: station,
          umbrella: umbrella,
          rentalType: RentalType.rental,
        ),
      ),
    );
  }

  void _showUmbrellaSelection(BuildContext context, WidgetRef ref) {
    final availableUmbrellas = station.umbrellas
        .where((u) => u.status == UmbrellaStatus.available)
        .toList();

    if (availableUmbrellas.isNotEmpty) {
      _selectUmbrella(context, ref, availableUmbrellas.first);
    }
  }
}

void showStationDetailsBottomSheet(BuildContext context, Station station) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StationDetailsBottomSheet(station: station),
  );
}
