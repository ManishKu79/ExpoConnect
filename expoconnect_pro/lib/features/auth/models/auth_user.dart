import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? profileImage;
  final String role;
  final bool isEmailVerified;
  final DateTime createdAt;

  const AuthUser({
    required this.id,
    required this.email,
    required this.name,
    this.profileImage,
    this.role = 'visitor',
    this.isEmailVerified = false,
    required this.createdAt,
  });

  AuthUser copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImage,
    String? role,
    bool? isEmailVerified,
    DateTime? createdAt,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      role: role ?? this.role,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, email, name, profileImage, role, isEmailVerified, createdAt];
}

class AuthState {
  final AuthUser? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    AuthUser? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  factory AuthState.initial() => const AuthState();

  factory AuthState.authenticated(AuthUser user) => AuthState(
        user: user,
        isAuthenticated: true,
      );

  factory AuthState.loading() => const AuthState(isLoading: true);

  factory AuthState.error(String message) => AuthState(
        error: message,
      );
}