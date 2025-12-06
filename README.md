# Property Management App

A clean and minimal Property Management application built with Flutter.
It supports a 3-way login (Employee, Tenant, Landlord), a dashboard for tenants, home services, service request forms, queries/tickets, and a basic profile section.

The design follows a clean white canvas theme with black and grey typography.

---

## Tech Stack

- Flutter 3.x
- Dart
- Provider/Riverpod (any state manager)
- Backend: Any (Firebase/AWS/Node)
- Deployment: Android + iOS

---

## Features

- 3-Way Login (Employee / Tenant / Landlord)
- Tenant Dashboard
- MyGate-style Home Services
- Service Request Form
- Raise Query + Ticket History
- Minimal UI theme
- Cross-platform support

---

# Getting Started

## Requirements

Make sure you have:

- Flutter SDK
- Dart SDK
- Xcode (for macOS/iOS)
- Android Studio
- Git

---

## Setup

- Clone the repo:

```bash
git clone https://github.com/<your-repo>/property-management-app.git
cd property-management-app
```

- Install dependencies:

```bash
flutter pub get
```

- Run the app:

```bash
flutter run
```

---

# Android Build Guide

## Build a Release APK

```bash
flutter build apk --release
```

- The file will be generated at:

```bash
build/app/outputs/flutter-apk/app-release.apk
```

## Build AAB for Play Store

```bash
flutter build appbundle --release
```

- The file will be at:

```bash
build/app/outputs/bundle/release/app-release.aab
```

---

## Android Signing Setup (first time)

- Generate a keystore:

```bash
keytool -genkey -v -keystore ~/key.jks \
-keyalg RSA -keysize 2048 -validity 10000 -alias key
```

- Move key.jks to:

```bash
android/app/key.jks
```

- Create android/key.properties:

```bash
storePassword=<password>
keyPassword=<password>
keyAlias=key
storeFile=key.jks
```

Flutter will auto-load this for signing.

---

## iOS Build Guide

### Install Pods

```bash
cd ios
pod install
cd ..
```

- Run on simulator:

```bash
flutter run
```

### Build for Release (IPA)

```bash
flutter build ipa --release
```

- IPA file will be generated in:

```bash
build/ios/ipa
```

### Build for Profile (Testing/TestFlight)

```bash
flutter build ipa --profile
```

- Or archive via Xcode:

```bash
open ios/Runner.xcworkspace
```

In Xcode:

1. Select "Any iOS Device (arm64)"
2. Choose Profile or Release
3. Product → Archive
4. Distribute via TestFlight
