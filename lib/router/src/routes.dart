part of '../router.dart';

/// Extension to convert route names to paths by adding a leading slash
extension Convert on String {
  String get p => '/$this';
}

/// Route names used throughout the app
class Routes {
  Routes._();

  // Splash screen route (initial route)
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const starting = '/starting';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';

  // Add more routes here as needed
  // Example: static const home = 'home';
}

/// Global navigator key for accessing navigator state
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Route observer provider for monitoring route changes
final routeObserverProvider = Provider<RouteObserver<PageRoute>>(
  (ref) => RouteObserver<PageRoute>(),
);

/// GoRouter provider that defines all app routes
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    routes: [
      // Splash Screen Route
      GoRoute(
        name: Routes.splash,
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Add more routes here as needed
      // Example:
      GoRoute(
        name: Routes.onboarding,
        path: Routes.onboarding.p,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        name: Routes.starting,
        path: Routes.starting.p,
        builder: (context, state) => const StartingScreen(),
      ),
      GoRoute(
        name: Routes.login,
        path: Routes.login.p,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: Routes.register,
        path: Routes.register.p,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        name: Routes.home,
        path: Routes.home.p,
        builder: (context, state) => const MainNavigation(),
      ),
    ],
  );
});
