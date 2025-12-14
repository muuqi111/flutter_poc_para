import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/rental.dart';

class RentalHistoryCard extends StatelessWidget {
  final Rental rental;
  final VoidCallback? onTap;

  const RentalHistoryCard({
    super.key,
    required this.rental,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = rental.status == RentalStatus.active;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isActive
            ? const BorderSide(color: Colors.blue, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(rental.startTime),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${rental.totalCost.toStringAsFixed(2)} EUR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.cyan[300]
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildStatusChip(),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 12),

              // Infos
              Row(
                children: [
                  Expanded(
                    child: _buildInfoChip(
                      icon: Icons.location_on,
                      label: rental.startStationName,
                    ),
                  ),
                  if (rental.endStationName != null) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.arrow_forward, color: Colors.grey, size: 16),
                    ),
                    Expanded(
                      child: _buildInfoChip(
                        icon: Icons.flag,
                        label: rental.endStationName!,
                      ),
                    ),
                  ],
                ],
              ),

              if (rental.endTime != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      'Duree: ${rental.formattedDuration}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: rental.statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        rental.statusText,
        style: TextStyle(
          color: rental.statusColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) return 'Aujourd\'hui';
    if (difference.inDays == 1) return 'Hier';
    if (difference.inDays < 7) return 'Il y a ${difference.inDays} jours';

    return DateFormat('dd/MM/yyyy').format(date);
  }
}
