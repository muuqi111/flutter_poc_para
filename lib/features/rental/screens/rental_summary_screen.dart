import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/config/constants.dart';
import '../../../data/models/rental.dart';

class RentalSummaryScreen extends StatelessWidget {
  final Rental rental;

  const RentalSummaryScreen({
    super.key,
    required this.rental,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final duration = rental.duration;
    final hours = duration.inHours;
    final hasPenalty = hours >= AppConstants.maxRentalHours;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recapitulatif'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header succes
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: hasPenalty
                      ? [Colors.orange[400]!, Colors.red[400]!]
                      : [Colors.green[400]!, Colors.teal[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Icon(
                    hasPenalty ? Icons.warning_amber : Icons.check_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    hasPenalty
                        ? 'Location terminee avec penalite'
                        : 'Location terminee',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Merci d\'avoir utilise Rainy !',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Details de la location
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.receipt_long, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Details de la location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildDetailRow(
                      context,
                      icon: Icons.umbrella,
                      label: 'Parapluie',
                      value: rental.umbrellaId.length > 3
                          ? rental.umbrellaId.substring(rental.umbrellaId.length - 3)
                          : rental.umbrellaId,
                    ),
                    const Divider(),
                    _buildDetailRow(
                      context,
                      icon: Icons.play_arrow,
                      label: 'Debut',
                      value: DateFormat('dd/MM/yyyy a HH:mm', 'fr_FR')
                          .format(rental.startTime),
                    ),
                    const Divider(),
                    _buildDetailRow(
                      context,
                      icon: Icons.stop,
                      label: 'Fin',
                      value: rental.endTime != null
                          ? DateFormat('dd/MM/yyyy a HH:mm', 'fr_FR')
                              .format(rental.endTime!)
                          : '-',
                    ),
                    const Divider(),
                    _buildDetailRow(
                      context,
                      icon: Icons.location_on,
                      label: 'Station depart',
                      value: rental.startStationName,
                    ),
                    const Divider(),
                    _buildDetailRow(
                      context,
                      icon: Icons.flag,
                      label: 'Station retour',
                      value: rental.endStationName ?? '-',
                    ),
                    const Divider(),
                    _buildDetailRow(
                      context,
                      icon: Icons.schedule,
                      label: 'Duree totale',
                      value: rental.formattedDuration,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Facturation
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.euro, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Facturation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildPriceRow(
                      context,
                      '$hours h x ${AppConstants.hourlyRate.toStringAsFixed(2)} EUR',
                      '${(hours * AppConstants.hourlyRate).toStringAsFixed(2)} EUR',
                    ),

                    if (hasPenalty) ...[
                      const SizedBox(height: 8),
                      _buildPriceRow(
                        context,
                        'Penalite (>100h)',
                        '${AppConstants.penaltyFee.toStringAsFixed(2)} EUR',
                        color: Colors.red,
                      ),
                    ],

                    const Divider(height: 24),

                    _buildPriceRow(
                      context,
                      'TOTAL',
                      '${rental.totalCost.toStringAsFixed(2)} EUR',
                      isBold: true,
                      isTotal: true,
                    ),

                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.green[900]?.withValues(alpha: 0.3)
                            : Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: isDark ? Colors.green[300] : Colors.green[700],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Le paiement sera preleve sur votre moyen de paiement enregistre.',
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.green[100] : Colors.green[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Bouton retour accueil
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.home),
                label: const Text('Retour a l\'accueil'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextButton.icon(
              onPressed: () {
                // TODO: Partager ou telecharger facture
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Facture envoyee par email !'),
                  ),
                );
              },
              icon: const Icon(Icons.receipt),
              label: const Text('Recevoir la facture par email'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    BuildContext context,
    String label,
    String price, {
    Color? color,
    bool isBold = false,
    bool isTotal = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color ?? (isDark ? Colors.grey[300] : Colors.grey[700]),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 18 : 14,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: isTotal
                  ? (isDark ? Colors.cyan[300] : Theme.of(context).primaryColor)
                  : (color ?? (isDark ? Colors.grey[100] : Colors.grey[900])),
              fontSize: isBold ? 24 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
