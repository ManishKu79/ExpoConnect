import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/organizer/models/organizer_profile.dart';
import '../features/organizer/models/organizer_expo.dart';
import '../features/organizer/models/organizer_visitor.dart';
import '../features/organizer/models/stall_allocation.dart';
import '../features/organizer/models/organizer_analytics.dart';
import '../repositories/organizer_repository.dart';

// Repository Provider
final organizerRepositoryProvider = Provider<OrganizerRepository>((ref) {
  return OrganizerRepository();
});

// --- Profile Providers ---
final organizerProfileProvider = FutureProvider<OrganizerProfile>((ref) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getProfile();
});

// --- Expo Providers ---
final organizerExposProvider = FutureProvider<List<OrganizerExpo>>((ref) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getExpos();
});

final organizerExpoDetailsProvider = FutureProvider.family<OrganizerExpo?, String>((ref, id) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getExpoById(id);
});

// --- Visitor Providers ---
final organizerVisitorsProvider = FutureProvider<List<OrganizerVisitor>>((ref) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getVisitors();
});

final organizerActiveVisitorsProvider = FutureProvider<List<OrganizerVisitor>>((ref) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getActiveVisitors();
});

// --- Stall Providers ---
final organizerStallsProvider = FutureProvider<List<StallAllocation>>((ref) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getStallAllocations();
});

final organizerStallsByExpoProvider = FutureProvider.family<List<StallAllocation>, String>((ref, expoId) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getStallsByExpo(expoId);
});

// --- Analytics Providers ---
final organizerAnalyticsProvider = FutureProvider<OrganizerAnalytics>((ref) async {
  final repo = ref.watch(organizerRepositoryProvider);
  return repo.getAnalytics();
});

// --- Notifier for Mutations ---
class OrganizerNotifier extends StateNotifier<Map<String, dynamic>> {
  final OrganizerRepository _repository;

  OrganizerNotifier(this._repository) : super({});

  Future<void> createExpo(OrganizerExpo expo) async {
    await _repository.createExpo(expo);
    state = {...state, 'expo_created': true};
  }

  Future<void> updateExpo(OrganizerExpo expo) async {
    await _repository.updateExpo(expo);
    state = {...state, 'expo_updated': true};
  }

  Future<void> allocateStall(StallAllocation stall) async {
    await _repository.allocateStall(stall);
    state = {...state, 'stall_allocated': true};
  }

  Future<void> updateStallStatus(String stallId, StallStatus status) async {
    await _repository.updateStallStatus(stallId, status);
    state = {...state, 'stall_updated': true};
  }
}

final organizerNotifierProvider = StateNotifierProvider<OrganizerNotifier, Map<String, dynamic>>((ref) {
  final repo = ref.watch(organizerRepositoryProvider);
  return OrganizerNotifier(repo);
});