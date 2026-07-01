import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/models/auth_user.dart';
import '../repositories/auth_repository.dart';

// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Auth State Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState.initial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final user = await _authRepository.currentUser;
    if (user != null) {
      state = AuthState.authenticated(user);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = AuthState.loading();
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      state = AuthState.loading();
      final user = await _authRepository.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      state = AuthState.loading();
      await _authRepository.logout();
      state = AuthState.initial();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      state = AuthState.loading();
      await _authRepository.forgotPassword(email);
      state = AuthState(
        user: state.user,
        isLoading: false,
      );
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> verifyEmail(String email, String code) async {
    try {
      state = AuthState.loading();
      await _authRepository.verifyEmail(email, code);
      final user = await _authRepository.currentUser;
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.initial();
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void clearError() {
    if (state.error != null) {
      state = state.copyWith(error: null);
    }
  }
}

// Auth State Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});

// Current User Provider
final currentUserProvider = Provider<AuthUser?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.user;
});

// Is Authenticated Provider
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.isAuthenticated;
});

// Auth Loading Provider
final authLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.isLoading;
});

// Auth Error Provider
final authErrorProvider = Provider<String?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.error;
});