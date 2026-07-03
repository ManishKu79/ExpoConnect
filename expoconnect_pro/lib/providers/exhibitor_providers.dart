import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/exhibitor/models/exhibitor_profile.dart';
import '../features/exhibitor/models/lead.dart';
import '../features/exhibitor/models/stall.dart';
import '../features/exhibitor/models/analytics.dart';
import '../repositories/exhibitor_repository.dart';

// Repository Provider
final exhibitorRepositoryProvider = Provider<ExhibitorRepository>((ref) {
  return ExhibitorRepository();
});

// --- Profile Providers ---
final exhibitorProfileProvider = FutureProvider<ExhibitorProfile>((ref) async {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return repo.getProfile();
});

// --- Stall Providers ---
final stallProvider = FutureProvider<Stall>((ref) async {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return repo.getStall();
});

// --- Lead Providers ---
final leadsProvider = FutureProvider<List<Lead>>((ref) async {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return repo.getLeads();
});

final leadsByStatusProvider = FutureProvider.family<List<Lead>, LeadStatus>((ref, status) async {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return repo.getLeadsByStatus(status);
});

// --- Analytics Providers ---
final analyticsProvider = FutureProvider<ExhibitorAnalytics>((ref) async {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return repo.getAnalytics();
});

// --- Report Providers ---
final reportsProvider = FutureProvider<List<Report>>((ref) async {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return repo.getReports();
});

// --- Notifier for Mutations ---
class ExhibitorNotifier extends StateNotifier<Map<String, dynamic>> {
  final ExhibitorRepository _repository;

  ExhibitorNotifier(this._repository) : super({});

  Future<void> updateLeadStatus(String leadId, LeadStatus status) async {
    await _repository.updateLeadStatus(leadId, status);
    state = {...state, 'lead_$leadId': status};
  }

  Future<void> addNote(String leadId, String note) async {
    await _repository.addNoteToLead(leadId, note);
    state = {...state, 'note_$leadId': true};
  }

  Future<void> generateReport(ReportType type) async {
    await _repository.generateReport(type);
    state = {...state, 'report_generated': true};
  }

  Future<void> scanQR(String code) async {
    await _repository.scanQRCode(code);
    state = {...state, 'scan_success': true};
  }
}

final exhibitorNotifierProvider = StateNotifierProvider<ExhibitorNotifier, Map<String, dynamic>>((ref) {
  final repo = ref.watch(exhibitorRepositoryProvider);
  return ExhibitorNotifier(repo);
});