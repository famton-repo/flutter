import 'package:flutter/material.dart';

/// A simple authentication service that holds the current user's state.
/// Uses [ValueNotifier] so [AuthGate] can rebuild reactively on login/logout.
///
/// Replace the body of [signIn] and [signOut] with real Firebase / backend
/// calls when you are ready to add proper authentication.
class AuthService {
  // ─── Singleton ─────────────────────────────────────────────────────────────

  AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  // ─── Auth State ────────────────────────────────────────────────────────────

  /// `null`  → not logged in
  /// non-null → email of the logged-in user
  final ValueNotifier<String?> currentUserEmail = ValueNotifier<String?>(null);

  bool get isLoggedIn => currentUserEmail.value != null;

  // ─── Sign In ───────────────────────────────────────────────────────────────

  /// Returns `null` on success or an error message string on failure.
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    // TODO: Replace with real authentication (e.g. Firebase Auth).
    await Future.delayed(const Duration(milliseconds: 800)); // simulate network

    if (email.trim().isEmpty || password.trim().isEmpty) {
      return 'Email and password cannot be empty.';
    }

    // Mock credential check — remove when using real auth.
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    currentUserEmail.value = email.trim();
    return null; // success
  }

  // ─── Register ──────────────────────────────────────────────────────────────

  /// Returns `null` on success or an error message string on failure.
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    // TODO: Replace with real registration logic.
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.trim().isEmpty || password.trim().isEmpty) {
      return 'Email and password cannot be empty.';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    currentUserEmail.value = email.trim();
    return null; // success
  }

  // ─── Sign Out ──────────────────────────────────────────────────────────────

  Future<void> signOut() async {
    // TODO: Replace with real sign-out logic.
    await Future.delayed(const Duration(milliseconds: 300));
    currentUserEmail.value = null;
  }
}
