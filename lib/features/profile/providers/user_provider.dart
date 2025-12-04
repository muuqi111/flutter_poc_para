import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/user.dart';
import '../../../data/dummy_data/user_data.dart';

/// Provider pour l'utilisateur actuel
final userProvider = StateProvider<User>((ref) {
  return dummyUser;
});

/// Provider pour le solde de l'utilisateur
final userBalanceProvider = Provider<double>((ref) {
  final user = ref.watch(userProvider);
  return user.balance;
});
