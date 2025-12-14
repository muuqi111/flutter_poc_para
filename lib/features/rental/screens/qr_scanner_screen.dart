import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/constants.dart';
import '../../../data/models/station.dart';
import '../../../data/models/umbrella.dart';
import '../../../data/models/rental.dart';
import '../providers/active_rental_provider.dart';
import 'active_rental_screen.dart';

class QRScannerScreen extends ConsumerStatefulWidget {
  final Station station;
  final Umbrella umbrella;
  final RentalType rentalType;

  const QRScannerScreen({
    super.key,
    required this.station,
    required this.umbrella,
    required this.rentalType,
  });

  @override
  ConsumerState<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends ConsumerState<QRScannerScreen>
    with SingleTickerProviderStateMixin {
  bool _isScanning = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Simuler le scan apres 2.5 secondes
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() => _isScanning = false);
        _onQRScanned();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onQRScanned() {
    // Creer la reservation
    final rentalId = 'rental_${DateTime.now().millisecondsSinceEpoch}';

    ref
        .read(activeRentalProvider.notifier)
        .startRental(
          oderId: rentalId,
          userId: 'user_001',
          umbrella: widget.umbrella,
          station: widget.station,
          type: widget.rentalType,
        );

    // Naviguer vers ecran de location active
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ActiveRentalScreen()),
        );
      }
    });
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
          // Fond simule camera
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[900]!, Colors.grey[800]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Zone de scan
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Cadre de scan
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    // Coins du cadre
                    ..._buildCorners(),

                    // Ligne de scan animee
                    if (_isScanning)
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Positioned(
                            top: 40 + _animation.value,
                            child: Container(
                              width: 240,
                              height: 3,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.cyan,
                                    Colors.transparent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(2),
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
                      ),

                    // Contenu central
                    _isScanning
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                size: 80,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Scannez le QR Code\nde la borne',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'QR Code detecte !',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),

                const SizedBox(height: 40),

                // Indicateur de chargement
                if (_isScanning)
                  Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.cyan,
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Recherche en cours...',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Info en bas
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: widget.umbrella.colorValue.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.umbrella,
                            color: widget.umbrella.colorValue,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.station.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Parapluie ${widget.umbrella.shortId} - ${widget.umbrella.colorName}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location horaire',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          '${AppConstants.hourlyRate.toStringAsFixed(2)} EUR/h',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
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
    const cornerSize = 30.0;
    const cornerWidth = 4.0;
    const color = Colors.cyan;

    return [
      // Top Left
      Positioned(
        top: -1,
        left: -1,
        child: Container(
          width: cornerSize,
          height: cornerSize,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: color, width: cornerWidth),
              left: BorderSide(color: color, width: cornerWidth),
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
          ),
        ),
      ),
      // Top Right
      Positioned(
        top: -1,
        right: -1,
        child: Container(
          width: cornerSize,
          height: cornerSize,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: color, width: cornerWidth),
              right: BorderSide(color: color, width: cornerWidth),
            ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
          ),
        ),
      ),
      // Bottom Left
      Positioned(
        bottom: -1,
        left: -1,
        child: Container(
          width: cornerSize,
          height: cornerSize,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: color, width: cornerWidth),
              left: BorderSide(color: color, width: cornerWidth),
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
          ),
        ),
      ),
      // Bottom Right
      Positioned(
        bottom: -1,
        right: -1,
        child: Container(
          width: cornerSize,
          height: cornerSize,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: color, width: cornerWidth),
              right: BorderSide(color: color, width: cornerWidth),
            ),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
          ),
        ),
      ),
    ];
  }
}
