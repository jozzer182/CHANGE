# 🔧 CHANGE - Setup Guide

This guide will help you configure the project after cloning.

## Prerequisites

- Flutter SDK (^3.7.2)
- Dart SDK
- Firebase account
- Google Cloud account (for Google Apps Script)

## Step 1: Clone the Repository

```bash
git clone https://github.com/jozzer182/CHANGE.git
cd CHANGE
```

## Step 2: Install Dependencies

```bash
flutter pub get
```

## Step 3: Configure Environment Variables

### 3.1 Create the `.env` file

Copy the example file and fill in your credentials:

```bash
cp .env.example .env
```

### 3.2 Edit `.env` with your values

```env
# Firebase Configuration (from Firebase Console > Project Settings)
FIREBASE_API_KEY=your_actual_api_key
FIREBASE_APP_ID=your_actual_app_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_AUTH_DOMAIN=your_project_id.firebaseapp.com
FIREBASE_STORAGE_BUCKET=your_project_id.firebasestorage.app
FIREBASE_MEASUREMENT_ID=your_measurement_id

# Google Apps Script APIs
API_MAIN_ENDPOINT=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
API_FILE_UPLOAD_ENDPOINT=https://script.google.com/macros/s/YOUR_UPLOAD_SCRIPT_ID/exec
```

## Step 4: Firebase Setup

### 4.1 Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use an existing one
3. Enable Authentication (Email/Password)

### 4.2 Configure Firebase for Web

1. In Firebase Console, go to Project Settings
2. Add a Web app
3. Copy the configuration values to your `.env` file

### 4.3 Configure Firebase for Android (Optional)

1. In Firebase Console, add an Android app
2. Download `google-services.json`
3. Place it in `android/app/` directory

## Step 5: Google Apps Script Setup

### 5.1 Main API (Data Operations)

The main API handles operations for:
- EURCOP exchange rates
- USDCOP exchange rates
- GM (Material Groups)
- ChangeOrder management

Deploy your Google Apps Script as a Web App and use the URL for `API_MAIN_ENDPOINT`.

### 5.2 File Upload API

This API handles file uploads to Google Drive.

Deploy your file upload script as a Web App and use the URL for `API_FILE_UPLOAD_ENDPOINT`.

## Step 6: Run the Application

### Web
```bash
flutter run -d chrome
```

### Android
```bash
flutter run -d android
```

### iOS
```bash
flutter run -d ios
```

## Troubleshooting

### Environment Variables Not Loading

Make sure:
1. The `.env` file exists in the root directory
2. The `.env` file is listed in `pubspec.yaml` under assets
3. `dotenv.load()` is called before Firebase initialization

### Firebase Authentication Issues

1. Verify your Firebase project has Email/Password authentication enabled
2. Check that the API key and project ID match your Firebase project
3. Ensure the Auth Domain is correctly configured

### API Connection Issues

1. Verify the Google Apps Script is deployed as a Web App
2. Check that the script has "Anyone" access (for public deployment)
3. Ensure the script URL is correct and includes `/exec` at the end

## Security Notes

⚠️ **NEVER commit the following files:**
- `.env` (contains real credentials)
- `google-services.json` (contains API keys)
- `GoogleService-Info.plist` (contains API keys)

These files are already in `.gitignore` for your protection.

---

For more information, see the main [README.md](../README.md).

