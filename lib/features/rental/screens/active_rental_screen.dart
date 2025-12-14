import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/config/constants.dart';
import '../../../data/models/rental.dart';
import '../providers/active_rental_provider.dart';
import 'return_qr_scanner_screen.dart';

enum AlertLevel {
  normal,
  warning,
  critical,
  penalty,
}

class ActiveRentalScreen extends ConsumerStatefulWidget {
  const ActiveRentalScreen({super.key});

  @override
  ConsumerState<ActiveRentalScreen> createState() => _ActiveRentalScreenState();
}

class _ActiveRentalScreenState extends ConsumerState<ActiveRentalScreen> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateElapsed();
    _startTimer();
  }

  void _updateElapsed() {
    final rental = ref.read(activeRentalProvider);
    if (rental != null) {
      setState(() {
        _elapsed = DateTime.now().difference(rental.startTime);
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final rental = ref.read(activeRentalProvider);
      if (rental != null && mounted) {
        setState(() {
          _elapsed = DateTime.now().difference(rental.startTime);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  /// Calcule le cout selon le nouveau modele : 0,20EUR/h + penalite si >100h
  /// Minimum 0.20 EUR des l'activation (1ere heure entamee = payee)
  double _calculateCurrentCost() {
    final hours = _elapsed.inHours;

    // Si plus de 100h : cout des 100h + penalite
    if (hours >= AppConstants.maxRentalHours) {
      final rentalCost = AppConstants.maxRentalHours * AppConstants.hourlyRate;
      return rentalCost + AppConstants.penaltyFee;
    }

    // Minimum 1 heure (0.20 EUR) des l'activation
    // Heure entamee = heure payee
    final billableHours = hours < 1 ? 1 : hours + 1;
    return billableHours * AppConstants.hourlyRate;
  }

  /// Heures ecoulees
  int _getElapsedHours() {
    return _elapsed.inHours;
  }

  /// Heures restantes avant penalite
  int _getHoursUntilPenalty() {
    final hours = _elapsed.inHours;
    if (hours >= AppConstants.maxRentalHours) return 0;
    return AppConstants.maxRentalHours - hours;
  }

  /// Determine le niveau d'alerte
  AlertLevel _getAlertLevel() {
    final hours = _elapsed.inHours;
    if (hours >= AppConstants.maxRentalHours) return AlertLevel.penalty;
    if (hours >= AppConstants.criticalThresholdHours) return AlertLevel.critical;
    if (hours >= AppConstants.warningThresholdHours) return AlertLevel.warning;
    return AlertLevel.normal;
  }

  @override
  Widget build(BuildContext context) {
    final rental = ref.watch(activeRentalProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (rental == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Location')),
        body: const Center(
          child: Text('Aucune location active'),
        ),
      );
    }

    final currentCost = _calculateCurrentCost();
    final elapsedHours = _getElapsedHours();
    final hoursUntilPenalty = _getHoursUntilPenalty();
    final alertLevel = _getAlertLevel();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              alertLevel == AlertLevel.penalty
                  ? 'Penalite appliquee'
                  : 'Location en cours',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '$elapsedHours h / ${AppConstants.maxRentalHours} h',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _showCloseConfirmation(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Card principale avec timer
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _getGradientColors(alertLevel),
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(Icons.umbrella, size: 80, color: Colors.white),
                    const SizedBox(height: 16),
                    Text(
                      alertLevel == AlertLevel.penalty
                          ? 'Penalite appliquee'
                          : 'Location active',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Parapluie ${rental.umbrellaId.length > 3 ? rental.umbrellaId.substring(rental.umbrellaId.length - 3) : rental.umbrellaId}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 24),
                    Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 2),
                    const SizedBox(height: 24),

                    // Timer
                    Text(
                      _formatDuration(_elapsed),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                    ),
                    Text(
                      'Temps ecoule',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Alertes selon niveau
                    _buildAlertWidget(alertLevel, hoursUntilPenalty),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Infos detaillees
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoRow(
                      context: context,
                      icon: Icons.location_on,
                      label: 'Station de depart',
                      value: rental.startStationName,
                    ),
                    const Divider(),
                    _buildInfoRow(
                      context: context,
                      icon: Icons.calendar_today,
                      label: 'Debut',
                      value: DateFormat('dd/MM/yyyy a HH:mm', 'fr_FR').format(rental.startTime),
                    ),
                    const Divider(),
                    _buildInfoRow(
                      context: context,
                      icon: Icons.schedule,
                      label: 'Heures ecoulees',
                      value: '$elapsedHours h',
                    ),
                    if (hoursUntilPenalty > 0) ...[
                      const Divider(),
                      _buildInfoRow(
                        context: context,
                        icon: Icons.alarm,
                        label: 'Avant penalite',
                        value: '$hoursUntilPenalty h',
                        valueColor: alertLevel == AlertLevel.critical
                            ? Colors.red
                            : alertLevel == AlertLevel.warning
                                ? Colors.orange
                                : null,
                      ),
                    ],
                    const Divider(),
                    _buildInfoRow(
                      context: context,
                      icon: Icons.euro,
                      label: 'Cout actuel',
                      value: '${currentCost.toStringAsFixed(2)} EUR',
                      valueStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.cyan[300] : Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Detail tarification
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
                          'Detail de la facturation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    _buildPriceRow(
                      context,
                      '$elapsedHours h x ${AppConstants.hourlyRate.toStringAsFixed(2)} EUR',
                      '${(elapsedHours * AppConstants.hourlyRate).toStringAsFixed(2)} EUR',
                    ),

                    if (alertLevel == AlertLevel.penalty) ...[
                      const SizedBox(height: 8),
                      _buildPriceRow(
                        context,
                        'Penalite (>100h)',
                        '${AppConstants.penaltyFee.toStringAsFixed(2)} EUR',
                        color: Colors.red,
                      ),
                      const Divider(height: 20),
                      _buildPriceRow(
                        context,
                        'TOTAL',
                        '${currentCost.toStringAsFixed(2)} EUR',
                        isBold: true,
                      ),
                    ],

                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.blue[900]?.withValues(alpha: 0.3)
                            : Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: isDark ? Colors.blue[200] : Colors.blue[800],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Tarif : 0,20EUR/h - Maximum 100h\nApres 100h : penalite de 35EUR',
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.blue[100] : Colors.blue[800],
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

            const SizedBox(height: 20),

            // Carte retour
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, size: 20, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        const Text(
                          'Ou restituer ?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Retournez votre parapluie dans n\'importe quelle borne ayant un emplacement libre.',
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        icon: const Icon(Icons.map),
                        label: const Text('Voir les bornes disponibles'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Bouton restituer
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showReturnQRScanner(context, rental),
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text('Restituer le parapluie'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextButton.icon(
              onPressed: () => _showProblemReport(context),
              icon: const Icon(Icons.report_problem, color: Colors.orange),
              label: const Text('Signaler un probleme'),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getGradientColors(AlertLevel level) {
    switch (level) {
      case AlertLevel.penalty:
        return [Colors.red[700]!, Colors.red[900]!];
      case AlertLevel.critical:
        return [Colors.orange[600]!, Colors.red[600]!];
      case AlertLevel.warning:
        return [Colors.orange[400]!, Colors.orange[600]!];
      case AlertLevel.normal:
        return [Colors.blue[400]!, Colors.cyan[300]!];
    }
  }

  Widget _buildAlertWidget(AlertLevel level, int hoursUntil) {
    String message;
    IconData icon;

    switch (level) {
      case AlertLevel.penalty:
        message = 'PENALITE APPLIQUEE\n+35EUR ajoutes au total';
        icon = Icons.error;
        break;
      case AlertLevel.critical:
        message = 'ATTENTION ! Plus que $hoursUntil h\navant penalite de 35EUR';
        icon = Icons.warning_amber;
        break;
      case AlertLevel.warning:
        message = 'Encore $hoursUntil h avant penalite\nPensez a restituer le parapluie';
        icon = Icons.schedule;
        break;
      case AlertLevel.normal:
        message = '$hoursUntil h restantes\navant penalite';
        icon = Icons.check_circle;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  Widget _buildInfoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
    TextStyle? valueStyle,
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
              style: valueStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? (isDark ? Colors.white : Colors.black87),
                  ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, String price, {Color? color, bool isBold = false}) {
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
              fontSize: isBold ? 16 : 14,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: color ?? (isDark ? Colors.cyan[300] : Colors.grey[900]),
              fontSize: isBold ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showReturnQRScanner(BuildContext context, Rental rental) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReturnQRScannerScreen(rental: rental),
      ),
    );
  }

  void _showCloseConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fermer ?'),
        content: const Text('Voulez-vous fermer cet ecran ? La location reste active.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Non'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Oui'),
          ),
        ],
      ),
    );
  }

  void _showProblemReport(BuildContext context) {
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
          children: [
            const Icon(Icons.report_problem, size: 60, color: Colors.orange),
            const SizedBox(height: 16),
            Text(
              'Signaler un probleme',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.broken_image_outlined, color: Colors.red),
              title: const Text('Parapluie endommage'),
              subtitle: const Text('Le parapluie est casse ou abime'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Probleme signale. Merci pour votre aide !')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.search_off, color: Colors.orange),
              title: const Text('Parapluie perdu'),
              subtitle: const Text('J\'ai perdu le parapluie'),
              onTap: () {
                Navigator.pop(context);
                _showLostConfirmation(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.blue),
              title: const Text('Autre probleme'),
              subtitle: const Text('Contacter le support'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Support contacte !')),
                );
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        ),
      ),
    );
  }

  void _showLostConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Parapluie perdu'),
        content: Text(
            'En cas de perte, des frais de ${AppConstants.lossFee.toStringAsFixed(2)} EUR seront appliques. Voulez-vous continuer ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perte signalee. Frais appliques.')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Confirmer la perte'),
          ),
        ],
      ),
    );
  }
}
