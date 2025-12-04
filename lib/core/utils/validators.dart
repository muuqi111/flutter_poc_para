/// Utilitaires de validation pour l'application
class Validators {
  /// Valide une adresse email
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Valide un numéro de téléphone belge (format 04XX XX XX XX)
  static bool isValidPhoneNumber(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'\s+'), '');
    final phoneRegex = RegExp(r'^04\d{8}$');
    return phoneRegex.hasMatch(cleanPhone);
  }

  /// Valide un code QR de borne (format: station_XXXXX)
  static bool isValidStationQR(String qrCode) {
    final qrRegex = RegExp(r'^station_[a-zA-Z0-9_]+$');
    return qrRegex.hasMatch(qrCode);
  }

  /// Valide un code QR de parapluie (format: umb_XXXXX)
  static bool isValidUmbrellaQR(String qrCode) {
    final qrRegex = RegExp(r'^umb_[a-zA-Z0-9_]+$');
    return qrRegex.hasMatch(qrCode);
  }

  /// Valide un montant (positif et max 2 décimales)
  static bool isValidAmount(String amount) {
    try {
      final value = double.parse(amount.replaceAll(',', '.'));
      if (value < 0) return false;
      final parts = amount.split(RegExp(r'[.,]'));
      if (parts.length > 1 && parts[1].length > 2) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Valide un nom (au moins 2 caractères, lettres et espaces uniquement)
  static bool isValidName(String name) {
    if (name.trim().length < 2) return false;
    final nameRegex = RegExp(r'^[a-zA-ZÀ-ÿ\s-]+$');
    return nameRegex.hasMatch(name);
  }

  /// Valide un mot de passe (min 8 caractères, 1 majuscule, 1 chiffre)
  static bool isValidPassword(String password) {
    if (password.length < 8) return false;
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasDigit = password.contains(RegExp(r'\d'));
    return hasUppercase && hasDigit;
  }

  /// Retourne un message d'erreur pour une validation d'email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'email est requis';
    }
    if (!isValidEmail(value)) {
      return 'Email invalide';
    }
    return null;
  }

  /// Retourne un message d'erreur pour une validation de nom
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le nom est requis';
    }
    if (!isValidName(value)) {
      return 'Nom invalide (lettres uniquement)';
    }
    return null;
  }

  /// Retourne un message d'erreur pour une validation de téléphone
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro de téléphone est requis';
    }
    if (!isValidPhoneNumber(value)) {
      return 'Numéro invalide (format: 04XX XX XX XX)';
    }
    return null;
  }

  /// Retourne un message d'erreur pour une validation de mot de passe
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }
    if (!isValidPassword(value)) {
      return 'Min 8 caractères, 1 majuscule, 1 chiffre';
    }
    return null;
  }
}
