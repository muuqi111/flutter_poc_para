import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/constants.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../providers/user_provider.dart';
import '../providers/theme_provider.dart';
import '../../rental/providers/rental_history_provider.dart';

/// Écran de profil complet
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final themeMode = ref.watch(themeModeProvider);
    final totalRentals = ref.watch(totalRentalsCountProvider);
    final totalCost = ref.watch(totalRentalCostProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mon profil',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
            tooltip: 'Changer le theme',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Naviguer vers parametres
            },
            tooltip: 'Parametres',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.spacingMd),
        child: Column(
          children: [
            // Header avec avatar et nom
            Container(
              padding: const EdgeInsets.all(AppConstants.spacingLg),
              decoration: BoxDecoration(
                gradient: AppColors.waterGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusLg),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      user.initials,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingMd),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingSm),
                  Text(
                    user.email,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.spacingLg),

            // Statistiques
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacingMd),
                      child: Column(
                        children: [
                          const Icon(Icons.umbrella, size: 32),
                          const SizedBox(height: AppConstants.spacingSm),
                          Text(
                            '$totalRentals',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Text('Locations'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.spacingMd),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacingMd),
                      child: Column(
                        children: [
                          const Icon(Icons.euro, size: 32),
                          const SizedBox(height: AppConstants.spacingSm),
                          Text(
                            Formatters.formatPrice(totalCost),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Text('Dépensé'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppConstants.spacingLg),

            // Menu
            _buildMenuSection(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingSm,
            vertical: AppConstants.spacingMd,
          ),
          child: Text(
            'PARAMÈTRES',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.credit_card),
                title: const Text('Moyens de paiement'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Gérer les moyens de paiement
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    // TODO: Toggle notifications
                  },
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Langue'),
                subtitle: const Text('Français'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Changer langue
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Aide & Support'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Support
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('À propos'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: À propos
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

