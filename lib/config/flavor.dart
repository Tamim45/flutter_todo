/// Enum to define different app flavors/environments
enum Flavor { dev, staging, prod }

/// Extension to get flavor name as string
extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.dev:
        return 'Development';
      case Flavor.staging:
        return 'Staging';
      case Flavor.prod:
        return 'Production';
    }
  }
}
