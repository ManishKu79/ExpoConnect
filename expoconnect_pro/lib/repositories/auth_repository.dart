import 'dart:async';
import '../features/auth/models/auth_user.dart';

class AuthRepository {
  static AuthRepository? _instance;
  
  factory AuthRepository() {
    _instance ??= AuthRepository._internal();
    return _instance!;
  }
  
  AuthRepository._internal();

  AuthUser? _currentUser;

  // Mock users for testing
  final Map<String, AuthUser> _mockUsers = {
    'demo@expoconnect.com': AuthUser(
      id: 'user_001',
      email: 'demo@expoconnect.com',
      name: 'Demo User',
      role: 'visitor',
      isEmailVerified: true,
      createdAt: DateTime.now(),
    ),
    'exhibitor@expoconnect.com': AuthUser(
      id: 'user_002',
      email: 'exhibitor@expoconnect.com',
      name: 'Exhibitor User',
      role: 'exhibitor',
      isEmailVerified: true,
      createdAt: DateTime.now(),
    ),
    'organizer@expoconnect.com': AuthUser(
      id: 'user_003',
      email: 'organizer@expoconnect.com',
      name: 'Organizer User',
      role: 'organizer',
      isEmailVerified: true,
      createdAt: DateTime.now(),
    ),
  };

  Future<AuthUser?> get currentUser async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _currentUser;
  }

  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }

    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    if (_mockUsers.containsKey(email)) {
      _currentUser = _mockUsers[email];
      return _currentUser!;
    }

    throw Exception('Invalid email or password');
  }

  Future<AuthUser> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String role = 'visitor',
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (name.isEmpty) {
      throw Exception('Name is required');
    }

    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Please enter a valid email');
    }

    if (password.isEmpty || password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    if (password != confirmPassword) {
      throw Exception('Passwords do not match');
    }

    if (_mockUsers.containsKey(email)) {
      throw Exception('User already exists with this email');
    }

    final newUser = AuthUser(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
      role: role,
      isEmailVerified: false,
      createdAt: DateTime.now(),
    );

    _mockUsers[email] = newUser;
    _currentUser = newUser;

    return _currentUser!;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }

  Future<void> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Please enter a valid email');
    }
  }

  Future<void> verifyEmail(String email, String code) async {
    await Future.delayed(const Duration(seconds: 1));

    if (code != '123456') {
      throw Exception('Invalid verification code');
    }

    if (_mockUsers.containsKey(email)) {
      final user = _mockUsers[email]!;
      _mockUsers[email] = user.copyWith(isEmailVerified: true);
      if (_currentUser?.email == email) {
        _currentUser = _mockUsers[email];
      }
    }
  }

  Future<void> resendVerification(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Please enter a valid email');
    }
  }

  Future<AuthUser> updateProfile({
    String? name,
    String? profileImage,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (_currentUser == null) {
      throw Exception('User not authenticated');
    }

    final updatedUser = _currentUser!.copyWith(
      name: name ?? _currentUser!.name,
      profileImage: profileImage ?? _currentUser!.profileImage,
    );

    _mockUsers[_currentUser!.email] = updatedUser;
    _currentUser = updatedUser;

    return _currentUser!;
  }

  bool isAuthenticated() {
    return _currentUser != null;
  }
}