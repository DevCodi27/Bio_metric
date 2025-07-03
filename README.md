# 🔐 Biometric Authentication App (Flutter)

A Flutter application for secure biometric login using fingerprint or face recognition. It redirects users to device settings if no biometrics are registered, and provides a smooth user experience with visual feedback and fallback options.

---

## 🚀 Features

- Biometric authentication (Fingerprint / Face ID)
- Redirects to security settings if biometrics aren't enrolled
- Displays alert dialogs for better UX
- Animated home screen using `animated_background`
- Fallback to PIN/Pattern available on failed attempts (native fallback)
- Settings redirection for both Android and iOS

---

## 📱 Screens

- **Authentication Screen**: Prompt with fingerprint icon and authentication button
- **Home Screen**: Accessed after successful login, animated background for engaging UI

---

## 🛠️ Setup & Installation

### 🔧 Prerequisites

- Flutter SDK (>= 3.8.1)
- Android Studio or VS Code
- Physical Android device with biometrics setup (preferably, fingerprint)
- Internet connection to fetch dependencies

---

### 💻 Getting Started

```bash
git clone https://github.com/your-username/bio_metric_app.git
cd bio_metric_app
flutter pub get
```

---

## ⚙️ Android Configuration

1. In `android/app/build.gradle`:

   ```gradle
   minSdkVersion 23
   ```

2. In `android/app/src/main/AndroidManifest.xml`, add:

   ```xml
   <uses-permission android:name="android.permission.USE_BIOMETRIC" />
   <uses-permission android:name="android.permission.USE_FINGERPRINT"/>
   <uses-feature android:name="android.hardware.fingerprint" android:required="true" />
   ```

3. In `android/build.gradle`, make sure:
   ```gradle
   ext.kotlin_version = '1.8.10'
   ```

---

## 🍏 iOS Configuration

1. In `ios/Runner/Info.plist`:

   ```xml
   <key>NSFaceIDUsageDescription</key>
   <string>This app uses Face ID to authenticate the user.</string>
   ```

2. iOS Deployment Target: >= 10.0

---

## 🧪 Run the App

```bash
flutter clean
flutter pub get
flutter run
```

To build release APK:

```bash
flutter build apk
```

Output:  
`build/app/outputs/flutter-apk/app-release.apk`

---

## 🧩 Folder Structure

```plaintext
lib/
├── main.dart        # Handles biometric logic and navigation
├── home.dart        # Home screen with animated visuals
```

---

## 📦 Dependencies

| Package                | Purpose                                 |
| ---------------------- | --------------------------------------- |
| local_auth             | Handle biometric authentication         |
| local_auth_android     | Platform-specific config for biometrics |
| android_intent_plus    | Android settings redirection            |
| app_settings           | Open app settings (iOS compatible)      |
| permission_handler     | Permission requests                     |
| animated_background    | Home screen animation                   |
| flutter_launcher_icons | Custom app icon                         |

---

## 🎨 Custom App Icon

- Update path in `pubspec.yaml`:
  ```yaml
  flutter_icons:
    android: true
    ios: true
    image_path: assets/images/fingerprint_app_icon.png
  ```
- Generate with:
  ```bash
  flutter pub run flutter_launcher_icons:main
  ```

---

## ⚠️ Notes

- App may not work on emulators that don’t support biometrics.
- If no fingerprint is registered, user is redirected to device **Security Settings**.
- Devices with **in-screen fingerprint sensors** may not show up in `getAvailableBiometrics()`, but authentication still works using `authenticate()` directly.

---

## 👨‍💻 Developer

**Stan Abishek A.**  
Job Seeker | Flutter Developer  
📫 _This project is part of my biometric security learning journey._

---

## 📄 License

This project is open-source .
