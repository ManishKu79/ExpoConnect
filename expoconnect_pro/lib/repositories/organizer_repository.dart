import 'dart:async';
import '../features/organizer/models/organizer_profile.dart';
import '../features/organizer/models/organizer_expo.dart';
import '../features/organizer/models/organizer_visitor.dart';
import '../features/organizer/models/stall_allocation.dart';
import '../features/organizer/models/organizer_analytics.dart';

class OrganizerRepository {
  static OrganizerRepository? _instance;
  
  factory OrganizerRepository() {
    _instance ??= OrganizerRepository._internal();
    return _instance!;
  }
  
  OrganizerRepository._internal();

  // Mock Organizer Profile
  final OrganizerProfile _mockProfile = OrganizerProfile(
    id: 'org_001',
    name: 'John Organizer',
    profileImage: 'https://picsum.photos/seed/john/200/200',
    company: 'Global Expo Management',
    email: 'john@globalexpo.com',
    phone: '+1 (555) 123-4567',
    isVerified: true,
    totalExpos: 8,
    totalVisitors: 15200,
    totalExhibitors: 640,
    joinedAt: DateTime.now().subtract(const Duration(days: 365)),
  );

  // Mock Expos
  final List<OrganizerExpo> _mockExpos = [
    OrganizerExpo(
      id: 'org_expo_001',
      title: 'TechConnect Global 2026',
      location: 'Berlin, Germany',
      date: DateTime(2026, 9, 15),
      endDate: DateTime(2026, 9, 18),
      description: 'The world\'s largest technology networking event.',
      imageUrl: 'https://picsum.photos/seed/tech1/400/200',
      visitorCount: 5000,
      exhibitorCount: 250,
      stallCount: 300,
      status: ExpoStatus.published,
      revenue: 450000,
      budget: 200000,
      categories: ['Technology', 'AI', 'Blockchain'],
    ),
    OrganizerExpo(
      id: 'org_expo_002',
      title: 'Business Expo 2026',
      location: 'London, UK',
      date: DateTime(2026, 10, 5),
      endDate: DateTime(2026, 10, 7),
      description: 'The premier business expo for entrepreneurs and investors.',
      imageUrl: 'https://picsum.photos/seed/business1/400/200',
      visitorCount: 3500,
      exhibitorCount: 180,
      stallCount: 200,
      status: ExpoStatus.published,
      revenue: 280000,
      budget: 150000,
      categories: ['Business', 'Entrepreneurship'],
    ),
    OrganizerExpo(
      id: 'org_expo_003',
      title: 'AI & Data Science Summit',
      location: 'San Francisco, CA',
      date: DateTime(2026, 11, 20),
      endDate: DateTime(2026, 11, 22),
      description: 'The ultimate AI and data science event.',
      imageUrl: 'https://picsum.photos/seed/ai2/400/200',
      visitorCount: 2800,
      exhibitorCount: 120,
      stallCount: 150,
      status: ExpoStatus.published,
      revenue: 320000,
      budget: 180000,
      categories: ['AI', 'Data Science'],
    ),
    OrganizerExpo(
      id: 'org_expo_004',
      title: 'Sustainability Summit 2026',
      location: 'Amsterdam, Netherlands',
      date: DateTime(2026, 12, 1),
      endDate: DateTime(2026, 12, 3),
      description: 'Global summit on sustainable business practices.',
      imageUrl: 'https://picsum.photos/seed/sustain1/400/200',
      visitorCount: 0,
      exhibitorCount: 0,
      stallCount: 100,
      status: ExpoStatus.draft,
      revenue: 0,
      budget: 100000,
      categories: ['Sustainability', 'Green Tech'],
    ),
  ];

  // Mock Visitors
  final List<OrganizerVisitor> _mockVisitors = [
    OrganizerVisitor(
      id: 'org_vis_001',
      name: 'Alice Johnson',
      profileImage: 'https://picsum.photos/seed/alice/100/100',
      email: 'alice@techcorp.com',
      phone: '+1 (555) 234-5678',
      company: 'TechCorp Inc.',
      position: 'Senior Engineer',
      registeredAt: DateTime.now().subtract(const Duration(days: 30)),
      lastActive: DateTime.now().subtract(const Duration(days: 2)),
      eventsAttended: 5,
      connections: 28,
      isActive: true,
    ),
    OrganizerVisitor(
      id: 'org_vis_002',
      name: 'Bob Smith',
      profileImage: 'https://picsum.photos/seed/bob/100/100',
      email: 'bob@startup.io',
      phone: '+1 (555) 345-6789',
      company: 'Startup Labs',
      position: 'Founder',
      registeredAt: DateTime.now().subtract(const Duration(days: 45)),
      lastActive: DateTime.now().subtract(const Duration(days: 5)),
      eventsAttended: 3,
      connections: 15,
      isActive: true,
    ),
    OrganizerVisitor(
      id: 'org_vis_003',
      name: 'Carol White',
      profileImage: 'https://picsum.photos/seed/carol/100/100',
      email: 'carol@datascience.com',
      phone: '+1 (555) 456-7890',
      company: 'Data Science Academy',
      position: 'Lead Data Scientist',
      registeredAt: DateTime.now().subtract(const Duration(days: 60)),
      lastActive: DateTime.now().subtract(const Duration(days: 1)),
      eventsAttended: 7,
      connections: 42,
      isActive: true,
    ),
    OrganizerVisitor(
      id: 'org_vis_004',
      name: 'David Lee',
      profileImage: 'https://picsum.photos/seed/david/100/100',
      email: 'david@fintech.com',
      phone: '+1 (555) 567-8901',
      company: 'FinTech Global',
      position: 'VP of Innovation',
      registeredAt: DateTime.now().subtract(const Duration(days: 20)),
      lastActive: DateTime.now().subtract(const Duration(days: 3)),
      eventsAttended: 2,
      connections: 8,
      isActive: false,
    ),
  ];

  // Mock Stall Allocations
  final List<StallAllocation> _mockStalls = [
    StallAllocation(
      id: 'stall_alloc_001',
      expoId: 'org_expo_001',
      exhibitorId: 'exh_001',
      exhibitorName: 'AI Innovations Inc.',
      boothNumber: 'B-101',
      location: 'Exhibition Hall A',
      size: 24.0,
      isPremium: true,
      price: 15000,
      status: StallStatus.confirmed,
      allocatedAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    StallAllocation(
      id: 'stall_alloc_002',
      expoId: 'org_expo_001',
      exhibitorId: 'exh_002',
      exhibitorName: 'CloudTech Solutions',
      boothNumber: 'B-102',
      location: 'Exhibition Hall A',
      size: 16.0,
      isPremium: false,
      price: 8000,
      status: StallStatus.confirmed,
      allocatedAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    StallAllocation(
      id: 'stall_alloc_003',
      expoId: 'org_expo_002',
      exhibitorId: 'exh_005',
      exhibitorName: 'Growth Capital Partners',
      boothNumber: 'C-201',
      location: 'Exhibition Hall B',
      size: 20.0,
      isPremium: true,
      price: 12000,
      status: StallStatus.confirmed,
      allocatedAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    StallAllocation(
      id: 'stall_alloc_004',
      expoId: 'org_expo_003',
      exhibitorId: 'exh_007',
      exhibitorName: 'DeepMind Technologies',
      boothNumber: 'D-301',
      location: 'Exhibition Hall C',
      size: 30.0,
      isPremium: true,
      price: 18000,
      status: StallStatus.reserved,
      allocatedAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
  ];

  // Mock Analytics
  final OrganizerAnalytics _mockAnalytics = OrganizerAnalytics(
    totalVisitors: 15200,
    totalExhibitors: 640,
    totalExpos: 8,
    activeExpos: 3,
    totalRevenue: 1250000,
    averageAttendance: 3800,
    averageExhibitorCount: 160,
    growthRate: 15.5,
    dailyStats: [
      DailyAnalytics(date: DateTime.now().subtract(const Duration(days: 6)), visitors: 120, exhibitors: 15, revenue: 25000),
      DailyAnalytics(date: DateTime.now().subtract(const Duration(days: 5)), visitors: 180, exhibitors: 22, revenue: 38000),
      DailyAnalytics(date: DateTime.now().subtract(const Duration(days: 4)), visitors: 220, exhibitors: 28, revenue: 45000),
      DailyAnalytics(date: DateTime.now().subtract(const Duration(days: 3)), visitors: 280, exhibitors: 35, revenue: 52000),
      DailyAnalytics(date: DateTime.now().subtract(const Duration(days: 2)), visitors: 310, exhibitors: 40, revenue: 68000),
      DailyAnalytics(date: DateTime.now().subtract(const Duration(days: 1)), visitors: 350, exhibitors: 45, revenue: 82000),
      DailyAnalytics(date: DateTime.now(), visitors: 400, exhibitors: 50, revenue: 95000),
    ],
    visitorByCategory: {
      'Technology': 4500,
      'Business': 3200,
      'AI': 2800,
      'Data Science': 2500,
      'Other': 2200,
    },
    revenueByExpo: {
      'TechConnect Global 2026': 450000,
      'Business Expo 2026': 280000,
      'AI & Data Science Summit': 320000,
      'Other Expos': 200000,
    },
  );

  // --- Profile Methods ---
  Future<OrganizerProfile> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProfile;
  }

  // --- Expo Methods ---
  Future<List<OrganizerExpo>> getExpos() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _mockExpos;
  }

  Future<OrganizerExpo?> getExpoById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockExpos.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<OrganizerExpo> createExpo(OrganizerExpo expo) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockExpos.add(expo);
    return expo;
  }

  Future<OrganizerExpo> updateExpo(OrganizerExpo expo) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockExpos.indexWhere((e) => e.id == expo.id);
    if (index != -1) {
      _mockExpos[index] = expo;
      return expo;
    }
    throw Exception('Expo not found');
  }

  // --- Visitor Methods ---
  Future<List<OrganizerVisitor>> getVisitors() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _mockVisitors;
  }

  Future<List<OrganizerVisitor>> getActiveVisitors() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockVisitors.where((v) => v.isActive).toList();
  }

  // --- Stall Methods ---
  Future<List<StallAllocation>> getStallAllocations() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockStalls;
  }

  Future<List<StallAllocation>> getStallsByExpo(String expoId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockStalls.where((s) => s.expoId == expoId).toList();
  }

  Future<StallAllocation> allocateStall(StallAllocation stall) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockStalls.add(stall);
    return stall;
  }

  Future<StallAllocation> updateStallStatus(String stallId, StallStatus status) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockStalls.indexWhere((s) => s.id == stallId);
    if (index != -1) {
      _mockStalls[index] = _mockStalls[index].copyWith(status: status);
      return _mockStalls[index];
    }
    throw Exception('Stall not found');
  }

  // --- Analytics Methods ---
  Future<OrganizerAnalytics> getAnalytics() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockAnalytics;
  }

  Future<OrganizerAnalytics> getAnalyticsByExpo(String expoId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    // In a real app, filter by expoId
    return _mockAnalytics;
  }
}