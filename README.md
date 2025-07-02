
# Biometric Authentication App (Flutter)

A simple Flutter application that demonstrates biometric authentication (like fingerprint) to access a protected screen with animated background. This project uses `local_auth` for biometric authentication and `animated_background` for a visually appealing home screen.

## 🚀 Features

- Biometric authentication using device-supported methods (e.g., fingerprint, face recognition).
- Secure login screen with fallback handling.
- Animated home screen using `animated_background` package.
- Easy navigation after successful login.

---

## 🛠️ Project Setup

### Prerequisites

Ensure the following tools are installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code with Flutter and Dart plugins
- A physical device or emulator (preferably with biometric capabilities)

### Clone the Repository

```bash
git clone https://github.com/your-username/bio_metric_app.git
cd bio_metric_app
```

### Install Dependencies

```bash
flutter pub get
```

### Android Configuration

1. Open `android/app/build.gradle` and ensure the following is added:

```gradle
minSdkVersion 23
```

2. Add required permissions in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.USE_BIOMETRIC" />
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
```

3. Also inside `<application>` tag:

```xml
<uses-feature android:name="android.hardware.fingerprint" android:required="true" />
```

4. In `android/build.gradle`, ensure `kotlin_version` is set properly:

```gradle
ext.kotlin_version = '1.8.10' // or latest supported version
```

### iOS Configuration (optional)

If you want to run on iOS:

- Add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSFaceIDUsageDescription</key>
<string>This app uses Face ID to authenticate the user.</string>
```

- Ensure iOS deployment target is >= 10.0.

---

## 🧪 Running the App

```bash
flutter run
```

Use a physical device with fingerprint or face authentication enabled.

---

## 📄 File Structure

```plaintext
/lib
│
├── main.dart          # Entry point with authentication logic
├── home.dart          # Home screen with animated background
```

---

## ⚠️ Limitations / Assumptions

- Works only on devices that support biometric hardware (emulator support may be limited).
- Biometric setup (fingerprint/face) must already be configured on the device.

---

## 📦 Packages Used

- [local_auth](https://pub.dev/packages/local_auth) – for biometric authentication
- [animated_background](https://pub.dev/packages/animated_background) – for animated visuals on the home screen

---

## 👨‍💻 Author

**Stan Abishek A.**  
Flutter Developer | CSE Student at PSNACET  
_Project created as part of personal learning & practice_

---

## 📃 License

This project is open source.
