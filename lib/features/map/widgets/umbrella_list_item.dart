import 'package:flutter/material.dart';
import '../../../data/models/umbrella.dart';

class UmbrellaListItem extends StatelessWidget {
  final Umbrella umbrella;
  final VoidCallback onSelect;

  const UmbrellaListItem({
    super.key,
    required this.umbrella,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onSelect,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icone couleur parapluie
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: umbrella.colorValue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.umbrella,
                  color: umbrella.colorValue,
                  size: 30,
                ),
              ),

              const SizedBox(width: 16),

              // Infos parapluie
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Parapluie ${umbrella.shortId}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.repeat,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${umbrella.totalRentals} locations',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Badge couleur
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: umbrella.colorValue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  umbrella.colorName,
                  style: TextStyle(
                    color: umbrella.colorValue,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
