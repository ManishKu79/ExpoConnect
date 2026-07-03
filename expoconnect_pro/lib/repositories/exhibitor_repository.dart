import 'dart:async';
import 'package:flutter/material.dart';
import '../features/exhibitor/models/exhibitor_profile.dart';
import '../features/exhibitor/models/lead.dart';
import '../features/exhibitor/models/stall.dart';
import '../features/exhibitor/models/analytics.dart';

class ExhibitorRepository {
  static ExhibitorRepository? _instance;
  
  factory ExhibitorRepository() {
    _instance ??= ExhibitorRepository._internal();
    return _instance!;
  }
  
  ExhibitorRepository._internal();

  // Mock Exhibitor Profile
  final ExhibitorProfile _mockProfile = ExhibitorProfile(
    id: 'exhibitor_001',
    companyName: 'Tech Innovations Inc.',
    logoUrl: 'https://picsum.photos/seed/techcorp/200/200',
    description: 'Leading provider of AI-driven solutions for enterprise automation.',
    website: 'https://techinnovations.com',
    industry: 'Artificial Intelligence',
    boothNumber: 'B-101',
    expoId: 'expo_001',
    contactEmail: 'info@techinnovations.com',
    contactPhone: '+1 (555) 123-4567',
    isVerified: true,
    socialLinks: ['https://linkedin.com/company/techinnovations', 'https://twitter.com/techinnovations'],
  );

  // Mock Stall
  final Stall _mockStall = Stall(
    id: 'stall_001',
    expoId: 'expo_001',
    boothNumber: 'B-101',
    location: 'Exhibition Hall, Section B',
    size: 24.0,
    isPremium: true,
    layoutImageUrl: 'https://picsum.photos/seed/stall/400/300',
    visitorCount: 128,
    leadCount: 23,
    amenities: [
      StallAmenity(id: 'a1', name: 'Wi-Fi', icon: Icons.wifi),
      StallAmenity(id: 'a2', name: 'Power Outlet', icon: Icons.power),
      StallAmenity(id: 'a3', name: 'Display Screen', icon: Icons.screen_share),
      StallAmenity(id: 'a4', name: 'Seating Area', icon: Icons.chair),
    ],
  );

  // Mock Leads
  final List<Lead> _mockLeads = [
    Lead(
      id: 'lead_001',
      visitorId: 'v001',
      visitorName: 'Dr. Sarah Chen',
      visitorEmail: 'sarah.chen@bigcorp.com',
      visitorPhone: '+1 (555) 234-5678',
      company: 'BigCorp Solutions',
      position: 'CTO',
      profileImage: 'https://picsum.photos/seed/sarah/100/100',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      status: LeadStatus.contacted,
      score: 85,
      interests: ['AI', 'Machine Learning', 'Cloud'],
      notes: 'Interested in our new AI product line. Requested a demo.',
    ),
    Lead(
      id: 'lead_002',
      visitorId: 'v002',
      visitorName: 'Michael Rodriguez',
      visitorEmail: 'm.rodriguez@startup.io',
      visitorPhone: '+1 (555) 345-6789',
      company: 'Startup Labs',
      position: 'Lead Engineer',
      profileImage: 'https://picsum.photos/seed/michael/100/100',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      status: LeadStatus.newLead,
      score: 72,
      interests: ['Blockchain', 'Web3'],
      notes: 'Came by to discuss integration possibilities.',
    ),
    Lead(
      id: 'lead_003',
      visitorId: 'v003',
      visitorName: 'Emily Watson',
      visitorEmail: 'emily.watson@datascience.com',
      visitorPhone: '+1 (555) 456-7890',
      company: 'Data Science Academy',
      position: 'Head of Curriculum',
      profileImage: 'https://picsum.photos/seed/emily/100/100',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      status: LeadStatus.meetingScheduled,
      score: 93,
      interests: ['Data Science', 'Education', 'AI Training'],
      notes: 'Scheduled a meeting for next week to discuss partnership.',
    ),
    Lead(
      id: 'lead_004',
      visitorId: 'v004',
      visitorName: 'James Anderson',
      visitorEmail: 'james.a@fintech.com',
      visitorPhone: '+1 (555) 567-8901',
      company: 'FinTech Global',
      position: 'VP of Innovation',
      profileImage: 'https://picsum.photos/seed/james/100/100',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      status: LeadStatus.negotiation,
      score: 88,
      interests: ['FinTech', 'AI', 'Security'],
      notes: 'Negotiating a pilot project for fraud detection.',
    ),
    Lead(
      id: 'lead_005',
      visitorId: 'v005',
      visitorName: 'Priya Sharma',
      visitorEmail: 'priya@healthtech.com',
      visitorPhone: '+1 (555) 678-9012',
      company: 'HealthTech Solutions',
      position: 'Product Manager',
      profileImage: 'https://picsum.photos/seed/priya/100/100',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      status: LeadStatus.won,
      score: 97,
      interests: ['HealthTech', 'AI Diagnostics', 'Cloud'],
      notes: 'Signed a contract for our AI diagnostic platform.',
    ),
  ];

  // Mock Analytics
  final ExhibitorAnalytics _mockAnalytics = ExhibitorAnalytics(
    totalVisitors: 128,
    totalLeads: 23,
    conversionRate: 18.0,
    meetingsScheduled: 12,
    demosGiven: 8,
    avgEngagementTime: 5.7,
    visitorByHour: {
      '09:00': 5,
      '10:00': 15,
      '11:00': 22,
      '12:00': 18,
      '13:00': 12,
      '14:00': 20,
      '15:00': 18,
      '16:00': 10,
      '17:00': 8,
    },
    leadBySource: {
      'Booth Visit': 12,
      'App Scan': 6,
      'Online': 3,
      'Referral': 2,
    },
    dailyStats: [
      DailyStat(date: DateTime.now().subtract(const Duration(days: 3)), visitors: 20, leads: 4),
      DailyStat(date: DateTime.now().subtract(const Duration(days: 2)), visitors: 35, leads: 6),
      DailyStat(date: DateTime.now().subtract(const Duration(days: 1)), visitors: 42, leads: 8),
      DailyStat(date: DateTime.now()), visitors: 31, leads: 5,
    ],
  );

  // Mock Reports
  final List<Report> _mockReports = [
    Report(
      id: 'report_001',
      title: 'Lead Summary Report',
      description: 'Summary of all leads captured during the expo.',
      generatedAt: DateTime.now().subtract(const Duration(hours: 2)),
      type: ReportType.leadSummary,
      fileUrl: 'https://example.com/reports/lead_summary.pdf',
    ),
    Report(
      id: 'report_002',
      title: 'Booth Performance Analytics',
      description: 'Detailed analytics on booth visits, engagement, and conversion.',
      generatedAt: DateTime.now().subtract(const Duration(days: 1)),
      type: ReportType.boothPerformance,
      fileUrl: 'https://example.com/reports/booth_analytics.pdf',
    ),
    Report(
      id: 'report_003',
      title: 'Competitor Analysis',
      description: 'Insights on competitor booth activities and visitor engagement.',
      generatedAt: DateTime.now().subtract(const Duration(days: 2)),
      type: ReportType.competitorAnalysis,
      fileUrl: 'https://example.com/reports/competitor_analysis.pdf',
    ),
  ];

  // --- Profile methods ---
  Future<ExhibitorProfile> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProfile;
  }

  Future<ExhibitorProfile> updateProfile(ExhibitorProfile updatedProfile) async {
    await Future.delayed(const Duration(seconds: 1));
    return updatedProfile;
  }

  // --- Stall methods ---
  Future<Stall> getStall() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockStall;
  }

  // --- Lead methods ---
  Future<List<Lead>> getLeads() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _mockLeads;
  }

  Future<List<Lead>> getLeadsByStatus(LeadStatus status) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockLeads.where((lead) => lead.status == status).toList();
  }

  Future<Lead> updateLeadStatus(String leadId, LeadStatus newStatus) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockLeads.indexWhere((lead) => lead.id == leadId);
    if (index != -1) {
      _mockLeads[index] = _mockLeads[index].copyWith(status: newStatus);
      return _mockLeads[index];
    }
    throw Exception('Lead not found');
  }

  Future<Lead> addNoteToLead(String leadId, String note) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockLeads.indexWhere((lead) => lead.id == leadId);
    if (index != -1) {
      final currentNotes = _mockLeads[index].notes ?? '';
      final updated = currentNotes.isEmpty ? note : '$currentNotes\n$note';
      _mockLeads[index] = _mockLeads[index].copyWith(notes: updated);
      return _mockLeads[index];
    }
    throw Exception('Lead not found');
  }

  // --- Analytics methods ---
  Future<ExhibitorAnalytics> getAnalytics() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockAnalytics;
  }

  // --- Reports methods ---
  Future<List<Report>> getReports() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockReports;
  }

  Future<Report> generateReport(ReportType type) async {
    await Future.delayed(const Duration(seconds: 2));
    final newReport = Report(
      id: 'report_${DateTime.now().millisecondsSinceEpoch}',
      title: '${type.toString().split('.').last} Report',
      description: 'Generated report for ${type.toString().split('.').last}',
      generatedAt: DateTime.now(),
      type: type,
      fileUrl: 'https://example.com/reports/${type.toString().split('.').last}_${DateTime.now().toIso8601String()}.pdf',
    );
    return newReport;
  }

  // --- QR Scanner simulation ---
  Future<Lead> scanQRCode(String code) async {
    await Future.delayed(const Duration(seconds: 1));
    final newLead = Lead(
      id: 'lead_${DateTime.now().millisecondsSinceEpoch}',
      visitorId: 'v_scan_${DateTime.now().millisecondsSinceEpoch}',
      visitorName: 'Scanned Visitor',
      company: 'New Company',
      position: 'Attendee',
      timestamp: DateTime.now(),
      status: LeadStatus.newLead,
      score: 50,
    );
    _mockLeads.insert(0, newLead);
    return newLead;
  }
}