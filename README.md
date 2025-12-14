# Rainy - Location de parapluies

Application Flutter de location de parapluies en libre-service.

## Installation sur mobile

### Android

#### Option 1 : Via USB (Debug)

1. **Activer le mode developpeur** sur votre telephone :
   - Aller dans `Parametres > A propos du telephone`
   - Appuyer 7 fois sur `Numero de build`
   - Retourner dans `Parametres > Options developpeur`
   - Activer `Debogage USB`

2. **Connecter** votre telephone en USB a l'ordinateur

3. **Verifier** la connexion :
   ```bash
   flutter devices
   ```

4. **Installer et lancer** :
   ```bash
   flutter run
   ```

#### Option 2 : Generer un APK

1. **Generer l'APK** :
   ```bash
   flutter build apk --release
   ```

2. **Recuperer le fichier** :
   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

3. **Transferer** l'APK sur votre telephone (USB, email, Drive...)

4. **Installer** l'APK (activer "Sources inconnues" si necessaire)

#### Option 3 : App Bundle (Play Store)

```bash
flutter build appbundle --release
```
Le fichier `.aab` sera dans `build/app/outputs/bundle/release/`

---

#### Option 1 : testée et recommandée

### iOS

#### Prerequis
- Un Mac avec Xcode installe
- Un compte Apple Developer (gratuit pour tests sur son propre appareil)

#### Option 1 : Via USB (Debug)

1. **Connecter** votre iPhone au Mac

2. **Ouvrir le projet iOS** dans Xcode :
   ```bash
   open ios/Runner.xcworkspace
   ```

3. **Configurer le signing** :
   - Dans Xcode, selectionner `Runner` dans le navigateur
   - Onglet `Signing & Capabilities`
   - Selectionner votre `Team` (compte Apple)
   - Xcode generera automatiquement un profil

4. **Faire confiance au developpeur** sur l'iPhone :
   - `Reglages > General > Gestion des appareils`
   - Selectionner votre compte developpeur
   - Appuyer sur "Faire confiance"

5. **Lancer** :
   ```bash
   flutter run
   ```

#### Option 2 : Build iOS (Archive)

1. **Builder** :
   ```bash
   flutter build ios --release
   ```

2. **Archiver** dans Xcode :
   - `Product > Archive`
   - Distribuer via TestFlight ou Ad Hoc

---

## Commandes utiles

```bash
# Installer les dependances
flutter pub get

# Regenerer les fichiers (freezed, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Verifier le code
flutter analyze

# Lancer en mode debug
flutter run

# Lancer en mode release
flutter run --release

# Voir les appareils connectes
flutter devices

# Nettoyer le projet
flutter clean && flutter pub get
```