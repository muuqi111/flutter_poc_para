import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../data/models/rental.dart';
import '../providers/rental_history_provider.dart';
import '../widgets/rental_history_card.dart';

class RentalHistoryScreen extends ConsumerStatefulWidget {
  const RentalHistoryScreen({super.key});

  @override
  ConsumerState<RentalHistoryScreen> createState() =>
      _RentalHistoryScreenState();
}

class _RentalHistoryScreenState extends ConsumerState<RentalHistoryScreen> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) {
    final allRentals = ref.watch(rentalHistoryProvider);
    final totalCost = ref.watch(totalRentalCostProvider);

    final filteredRentals = _filterRentals(allRentals, _filter);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Mes locations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${allRentals.length} location${allRentals.length > 1 ? 's' : ''} au total',
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
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (value) {
              setState(() => _filter = value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'all',
                child: Row(
                  children: [
                    Icon(
                      Icons.list,
                      color: _filter == 'all'
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    const SizedBox(width: 8),
                    const Text('Toutes'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'completed',
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: _filter == 'completed'
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    const SizedBox(width: 8),
                    const Text('Terminees'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'late',
                child: Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: _filter == 'late'
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    const SizedBox(width: 8),
                    const Text('Avec penalite'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'active',
                child: Row(
                  children: [
                    Icon(
                      Icons.pending,
                      color: _filter == 'active'
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    const SizedBox(width: 8),
                    const Text('En cours'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: allRentals.isEmpty
          ? _buildEmptyState()
          : Column(
              children: [
                // Stats en haut
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withValues(alpha: 0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(
                        icon: Icons.umbrella,
                        value: allRentals.length.toString(),
                        label: 'Total',
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                      _buildStatItem(
                        icon: Icons.check_circle,
                        value: allRentals
                            .where((r) =>
                                r.status == RentalStatus.completed ||
                                r.status == RentalStatus.late)
                            .length
                            .toString(),
                        label: 'Terminees',
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                      _buildStatItem(
                        icon: Icons.euro,
                        value: '${totalCost.toStringAsFixed(2)} EUR',
                        label: 'Depense',
                      ),
                    ],
                  ),
                ),

                // Filtre actif
                if (_filter != 'all')
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Chip(
                          label: Text(_getFilterLabel(_filter)),
                          deleteIcon: const Icon(Icons.close, size: 18),
                          onDeleted: () => setState(() => _filter = 'all'),
                        ),
                        const Spacer(),
                        Text(
                          '${filteredRentals.length} resultat${filteredRentals.length > 1 ? 's' : ''}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                // Liste
                Expanded(
                  child: filteredRentals.isEmpty
                      ? _buildNoResults()
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: filteredRentals.length,
                          itemBuilder: (context, index) {
                            final rental = filteredRentals[index];
                            return RentalHistoryCard(
                              rental: rental,
                              onTap: () => _showRentalDetails(context, rental),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Aucune location pour le moment',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vos locations apparaitront ici',
            style: TextStyle(color: Colors.grey[400]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Naviguer vers la carte
            },
            icon: const Icon(Icons.map),
            label: const Text('Trouver une borne'),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Aucun resultat',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => setState(() => _filter = 'all'),
            child: const Text('Voir toutes les locations'),
          ),
        ],
      ),
    );
  }

  List<Rental> _filterRentals(List<Rental> rentals, String filter) {
    switch (filter) {
      case 'completed':
        return rentals.where((r) => r.status == RentalStatus.completed).toList();
      case 'late':
        return rentals.where((r) => r.status == RentalStatus.late).toList();
      case 'active':
        return rentals.where((r) => r.status == RentalStatus.active).toList();
      default:
        return rentals;
    }
  }

  String _getFilterLabel(String filter) {
    switch (filter) {
      case 'completed':
        return 'Terminees';
      case 'late':
        return 'Avec penalite';
      case 'active':
        return 'En cours';
      default:
        return 'Toutes';
    }
  }

  void _showRentalDetails(BuildContext context, Rental rental) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: rental.statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.umbrella,
                    color: rental.statusColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy a HH:mm', 'fr_FR')
                            .format(rental.startTime),
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: rental.statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    rental.statusText,
                    style: TextStyle(
                      color: rental.statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Details
            _buildDetailRow(
              icon: Icons.confirmation_number,
              label: 'Reference',
              value: rental.id,
            ),
            _buildDetailRow(
              icon: Icons.umbrella,
              label: 'Parapluie',
              value: rental.umbrellaId,
            ),
            _buildDetailRow(
              icon: Icons.location_on,
              label: 'Station depart',
              value: rental.startStationName,
            ),
            if (rental.endStationName != null)
              _buildDetailRow(
                icon: Icons.flag,
                label: 'Station retour',
                value: rental.endStationName!,
              ),
            _buildDetailRow(
              icon: Icons.timer,
              label: 'Duree',
              value: rental.formattedDuration,
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Prix
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location horaire',
                        style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                      ),
                      Text('${rental.basePrice.toStringAsFixed(2)} EUR/h'),
                    ],
                  ),
                  if (rental.status == RentalStatus.late) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Penalite (>100h)',
                          style: TextStyle(color: Colors.red[400]),
                        ),
                        Text(
                          '35.00 EUR',
                          style: TextStyle(color: Colors.red[400]),
                        ),
                      ],
                    ),
                  ],
                  if (rental.extraCharges != null && rental.extraCharges! > 0) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Frais supplementaires',
                          style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                        ),
                        Text('${rental.extraCharges!.toStringAsFixed(2)} EUR'),
                      ],
                    ),
                  ],
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${rental.totalCost.toStringAsFixed(2)} EUR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isDark ? Colors.cyan[300] : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Fermer'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
