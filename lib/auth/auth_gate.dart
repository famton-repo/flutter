import 'package:famton_app/auth/auth_service.dart';
import 'package:famton_app/auth/login_or_register.dart';
import 'package:famton_app/pages/home_page.dart';
import 'package:flutter/material.dart';

/// AuthGate listens to [AuthService.currentUserEmail] and automatically
/// routes the user to either [HomePage] (logged in) or [LoginOrRegister]
/// (not logged in).
///
/// Place this widget as the [home] of [MaterialApp] in main.dart to enable
/// automatic, reactive auth-based routing throughout the app.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return ValueListenableBuilder<String?>(
      valueListenable: authService.currentUserEmail,
      builder: (context, userEmail, _) {
        // ── Logged in → show the home page ──────────────────────────────────
        if (userEmail != null) {
          return const HomePage();
        }

        // ── Not logged in → show login / register flow ───────────────────────
        return const LoginOrRegister();
      },
    );
  }
}
