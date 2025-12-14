import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/constants.dart';
import '../../../data/models/rental.dart';
import '../providers/active_rental_provider.dart';
import '../providers/rental_history_provider.dart';
import '../../map/providers/stations_provider.dart';
import 'rental_summary_screen.dart';

class ReturnQRScannerScreen extends ConsumerStatefulWidget {
  final Rental rental;

  const ReturnQRScannerScreen({
    super.key,
    required this.rental,
  });

  @override
  ConsumerState<ReturnQRScannerScreen> createState() => _ReturnQRScannerScreenState();
}

class _ReturnQRScannerScreenState extends ConsumerState<ReturnQRScannerScreen>
    with SingleTickerProviderStateMixin {
  bool _isScanning = true;
  bool _isProcessing = false;
  bool _isSuccess = false;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // Animation de pulse pour le cadre de scan
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Simuler le scan apres 2 secondes
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _onQRScanned();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onQRScanned() async {
    setState(() {
      _isScanning = false;
      _isProcessing = true;
    });

    // Animation de processing
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!mounted) return;

    setState(() {
      _isProcessing = false;
      _isSuccess = true;
    });

    // Attendre l'animation de succes
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Finaliser la location
    _completeRental();
  }

  void _completeRental() {
    final endTime = DateTime.now();
    final duration = endTime.difference(widget.rental.startTime);
    final hours = duration.inHours;

    // Calculer cout final
    double finalCost;
    if (hours >= AppConstants.maxRentalHours) {
      finalCost = (AppConstants.maxRentalHours * AppConstants.hourlyRate) +
          AppConstants.penaltyFee;
    } else {
      finalCost = hours * AppConstants.hourlyRate;
    }

    // Station de retour (simulee - HELMo)
    final stations = ref.read(stationsProvider);
    final endStation = stations.firstWhere(
      (s) => s.id == 'station_helmo',
      orElse: () => stations.first,
    );

    // Terminer la location
    ref.read(activeRentalProvider.notifier).completeRental(
          endStation: endStation,
        );

    // Recuperer la location terminee
    final completedRental = ref
        .read(activeRentalProvider.notifier)
        .getCompletedRentalAndClear();

    if (completedRental != null) {
      // Ajouter a l'historique avec le cout calcule
      final finalRental = completedRental.copyWith(
        totalCost: finalCost,
        status: hours >= AppConstants.maxRentalHours
            ? RentalStatus.late
            : RentalStatus.completed,
      );

      ref.read(rentalHistoryProvider.notifier).addRental(finalRental);

      // Naviguer vers recapitulatif
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => RentalSummaryScreen(rental: finalRental),
        ),
      );
    } else {
      // Fallback si pas de location
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Scanner le QR Code'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Fond avec effet de grille
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.blue[900]!.withValues(alpha: 0.3),
                  Colors.black,
                ],
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Zone de scan avec animation
                if (_isScanning) ...[
                  ScaleTransition(
                    scale: _pulseAnimation,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.cyan,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          // Coins animes
                          ..._buildCorners(),

                          // Icone centrale
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.qr_code_scanner,
                                  size: 100,
                                  color: Colors.cyan,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Positionnez le QR Code',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          // Ligne de scan qui descend
                          _ScanLineAnimation(),
                        ],
                      ),
                    ),
                  ),
                ] else if (_isProcessing) ...[
                  // Animation de processing
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
                            valueColor: AlwaysStoppedAnimation(Colors.cyan),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Traitement en cours...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Verification du QR Code',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else if (_isSuccess) ...[
                  // Animation de succes
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Checkmark anime
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween(begin: 0.0, end: 1.0),
                          curve: Curves.elasticOut,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 800),
                          tween: Tween(begin: 0.0, end: 1.0),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Column(
                                children: [
                                  const Text(
                                    'Parapluie restitue !',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Calcul de votre facture...',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Infos en bas
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Card(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.umbrella, color: Colors.cyan, size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parapluie ${widget.rental.umbrellaId.length > 3 ? widget.rental.umbrellaId.substring(widget.rental.umbrellaId.length - 3) : widget.rental.umbrellaId}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Restitution a HELMo Campus Guillemins',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCorners() {
    return [
      // Top-left
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.cyan, width: 4),
              left: BorderSide(color: Colors.cyan, width: 4),
            ),
          ),
        ),
      ),
      // Top-right
      Positioned(
        top: 10,
        right: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.cyan, width: 4),
              right: BorderSide(color: Colors.cyan, width: 4),
            ),
          ),
        ),
      ),
      // Bottom-left
      Positioned(
        bottom: 10,
        left: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.cyan, width: 4),
              left: BorderSide(color: Colors.cyan, width: 4),
            ),
          ),
        ),
      ),
      // Bottom-right
      Positioned(
        bottom: 10,
        right: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.cyan, width: 4),
              right: BorderSide(color: Colors.cyan, width: 4),
            ),
          ),
        ),
      ),
    ];
  }
}

class _ScanLineAnimation extends StatefulWidget {
  @override
  State<_ScanLineAnimation> createState() => _ScanLineAnimationState();
}

class _ScanLineAnimationState extends State<_ScanLineAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 280.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: _animation.value,
          left: 10,
          right: 10,
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.cyan,
                  Colors.cyan,
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withValues(alpha: 0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
