import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/onboarding_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/verify_email_screen.dart';
import '../features/visitor/presentation/screens/home_screen.dart';
import '../features/visitor/presentation/screens/expo_listing_screen.dart';
import '../features/visitor/presentation/screens/expo_details_screen.dart';
import '../features/visitor/presentation/screens/networking_screen.dart';
import '../features/visitor/presentation/screens/profile_screen.dart';
import '../features/visitor/presentation/screens/notifications_screen.dart';
import '../features/visitor/presentation/screens/qr_pass_screen.dart';
import '../features/visitor/presentation/screens/settings_screen.dart';
import '../features/visitor/presentation/screens/chat_screen.dart';
import '../features/exhibitor/presentation/screens/dashboard_screen.dart';
import '../features/exhibitor/presentation/screens/lead_dashboard_screen.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    // Auth Routes
    GoRoute(
      path: RouteNames.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RouteNames.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouteNames.register,
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: RouteNames.forgotPassword,
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: RouteNames.verifyEmail,
      name: 'verify-email',
      builder: (context, state) {
        final email = state.extra as String? ?? '';
        return VerifyEmailScreen(email: email);
      },
    ),
    // Visitor Routes
    GoRoute(
      path: RouteNames.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouteNames.expoListing,
      name: 'expo-listing',
      builder: (context, state) => const ExpoListingScreen(),
    ),
    GoRoute(
      path: '${RouteNames.expoDetails}/:id',
      name: 'expo-details',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return ExpoDetailsScreen(expoId: id);
      },
    ),
    GoRoute(
      path: RouteNames.networking,
      name: 'networking',
      builder: (context, state) => const NetworkingScreen(),
    ),
    GoRoute(
      path: RouteNames.profile,
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: RouteNames.notifications,
      name: 'notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: RouteNames.qrPass,
      name: 'qr-pass',
      builder: (context, state) => const QRPassScreen(),
    ),
    GoRoute(
      path: RouteNames.settings,
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: RouteNames.chat,
      name: 'chat',
      builder: (context, state) => const ChatScreen(),
    ),
    // Exhibitor Routes
    GoRoute(
      path: RouteNames.exhibitorDashboard,
      name: 'exhibitor-dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: RouteNames.leadDashboard,
      name: 'lead-dashboard',
      builder: (context, state) => const LeadDashboardScreen(),
    ),
  ],
);