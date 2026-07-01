import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/visitor/models/expo.dart';
import '../features/visitor/models/networking.dart';
import '../features/visitor/models/notification.dart';
import '../repositories/visitor_repository.dart';

// Repository Provider
final visitorRepositoryProvider = Provider<VisitorRepository>((ref) {
  return VisitorRepository();
});

// ---- Expo Providers ----

final exposProvider = FutureProvider<List<Expo>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getExpos();
});

final featuredExposProvider = FutureProvider<List<Expo>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getFeaturedExpos();
});

final expoDetailsProvider = FutureProvider.family<Expo?, String>((ref, id) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getExpoById(id);
});

final searchExposProvider = FutureProvider.family<List<Expo>, String>((ref, query) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.searchExpos(query);
});

final exposByCategoryProvider = FutureProvider.family<List<Expo>, String>((ref, category) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getExposByCategory(category);
});

// ---- Contact Providers ----

final contactsProvider = FutureProvider<List<Contact>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getContacts();
});

final connectedContactsProvider = FutureProvider<List<Contact>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getConnectedContacts();
});

final pendingContactsProvider = FutureProvider<List<Contact>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getPendingContacts();
});

// ---- Chat Providers ----

final chatMessagesProvider = FutureProvider.family<List<ChatMessage>, String>((ref, contactId) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getChatMessages(contactId);
});

// ---- Notification Providers ----

final notificationsProvider = FutureProvider<List<NotificationModel>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getNotifications();
});

final unreadNotificationsProvider = FutureProvider<List<NotificationModel>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getUnreadNotifications();
});

// ---- Saved Exhibitors Providers ----

final savedExhibitorIdsProvider = FutureProvider<List<String>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getSavedExhibitorIds();
});

final savedExhibitorsProvider = FutureProvider<List<Exhibitor>>((ref) async {
  final repo = ref.watch(visitorRepositoryProvider);
  return repo.getSavedExhibitors();
});

// ---- Notifiers for Mutations ----

class VisitorNotifier extends StateNotifier<Map<String, dynamic>> {
  final VisitorRepository _repository;

  VisitorNotifier(this._repository) : super({});

  Future<void> saveExhibitor(String exhibitorId) async {
    await _repository.saveExhibitor(exhibitorId);
    state = {...state, 'saved_$exhibitorId': true};
  }

  Future<void> unsaveExhibitor(String exhibitorId) async {
    await _repository.unsaveExhibitor(exhibitorId);
    state = {...state, 'saved_$exhibitorId': false};
  }

  Future<void> connectWithContact(String contactId) async {
    await _repository.connectWithContact(contactId);
    state = {...state, 'connected_$contactId': true};
  }

  Future<void> acceptConnection(String contactId) async {
    await _repository.acceptConnection(contactId);
    state = {...state, 'accepted_$contactId': true};
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    await _repository.markNotificationAsRead(notificationId);
    state = {...state, 'read_$notificationId': true};
  }

  Future<void> markAllNotificationsAsRead() async {
    await _repository.markAllNotificationsAsRead();
    state = {...state, 'all_read': true};
  }
}

final visitorNotifierProvider = StateNotifierProvider<VisitorNotifier, Map<String, dynamic>>((ref) {
  final repo = ref.watch(visitorRepositoryProvider);
  return VisitorNotifier(repo);
});