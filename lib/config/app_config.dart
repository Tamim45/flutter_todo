import 'flavor.dart';

/// App configuration class that holds flavor-specific settings
class AppConfig {
  final Flavor flavor;
  final String appName;
  final String apiBaseUrl;
  final bool enableLogging;

  AppConfig({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.enableLogging,
  });

  /// Development configuration
  static AppConfig dev() {
    return AppConfig(
      flavor: Flavor.dev,
      appName: 'MyApp Dev',
      apiBaseUrl: 'https://dev-api.example.com',
      enableLogging: true,
    );
  }

  /// Staging configuration
  static AppConfig staging() {
    return AppConfig(
      flavor: Flavor.staging,
      appName: 'MyApp Staging',
      apiBaseUrl: 'https://staging-api.example.com',
      enableLogging: true,
    );
  }

  /// Production configuration
  static AppConfig prod() {
    return AppConfig(
      flavor: Flavor.prod,
      appName: 'MyApp',
      apiBaseUrl: 'https://api.example.com',
      enableLogging: false,
    );
  }
}
