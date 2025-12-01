import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class to access environment variables
/// All sensitive credentials are loaded from .env file
class EnvConfig {
  // ========================================
  // Firebase Configuration
  // ========================================
  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  static String get firebaseAppId => dotenv.env['FIREBASE_APP_ID'] ?? '';
  static String get firebaseMessagingSenderId =>
      dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseProjectId =>
      dotenv.env['FIREBASE_PROJECT_ID'] ?? '';
  static String get firebaseAuthDomain =>
      dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '';
  static String get firebaseStorageBucket =>
      dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '';
  static String get firebaseMeasurementId =>
      dotenv.env['FIREBASE_MEASUREMENT_ID'] ?? '';

  // ========================================
  // Google Apps Script APIs
  // ========================================
  /// Main API endpoint for data operations (EURCOP, USDCOP, GM, ChangeOrder)
  static String get apiMainEndpoint => dotenv.env['API_MAIN_ENDPOINT'] ?? '';

  /// File upload API endpoint for Google Drive operations
  static String get apiFileUploadEndpoint =>
      dotenv.env['API_FILE_UPLOAD_ENDPOINT'] ?? '';

  // ========================================
  // Helper Methods
  // ========================================
  /// Returns the main API endpoint as a Uri
  static Uri get apiMainUri => Uri.parse(apiMainEndpoint);

  /// Returns the file upload API endpoint as a Uri
  static Uri get apiFileUploadUri => Uri.parse(apiFileUploadEndpoint);
}

