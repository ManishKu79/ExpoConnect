import 'dart:async';
import '../features/visitor/models/expo.dart';
import '../features/visitor/models/networking.dart';
import '../features/visitor/models/notification.dart';

class VisitorRepository {
  static VisitorRepository? _instance;
  
  factory VisitorRepository() {
    _instance ??= VisitorRepository._internal();
    return _instance!;
  }
  
  VisitorRepository._internal();

  // Mock Expo Data - Updated with all exhibitors
  final List<Expo> _mockExpos = [
    Expo(
      id: 'expo_001',
      title: 'TechConnect Global 2026',
      location: 'Berlin, Germany',
      date: DateTime(2026, 9, 15),
      description: 'The world\'s largest technology networking event. Connect with 500+ tech leaders from 40+ countries. Features AI, blockchain, cloud computing, and cybersecurity tracks.',
      imageUrl: 'https://picsum.photos/seed/tech1/400/200',
      exhibitorCount: 250,
      visitorCount: 5000,
      categories: ['Technology', 'AI', 'Blockchain', 'Cloud'],
      rating: 4.8,
      isFeatured: true,
      organizer: 'TechConnect Media Group',
      schedule: [
        ExpoSchedule(
          time: '09:00 - 10:00',
          title: 'Opening Keynote: Future of AI',
          description: 'Join industry leaders as they discuss the future of artificial intelligence and its impact on business.',
          speaker: 'Dr. Sarah Chen',
          location: 'Main Hall A',
        ),
        ExpoSchedule(
          time: '10:30 - 12:00',
          title: 'Blockchain Revolution Panel',
          description: 'Experts discuss the latest trends in blockchain technology and its applications beyond cryptocurrency.',
          speaker: 'Michael Rodriguez',
          location: 'Conference Room B',
        ),
        ExpoSchedule(
          time: '14:00 - 15:30',
          title: 'Cloud Computing Workshop',
          description: 'Hands-on workshop on cloud infrastructure, scaling, and security best practices.',
          speaker: 'Emily Watson',
          location: 'Workshop Studio C',
        ),
        ExpoSchedule(
          time: '16:00 - 18:00',
          title: 'Networking Reception',
          description: 'Connect with speakers, exhibitors, and fellow attendees over drinks and refreshments.',
          speaker: 'All Speakers',
          location: 'Exhibition Hall',
        ),
      ],
      exhibitors: [
        Exhibitor(
          id: 'exh_001',
          name: 'AI Innovations Inc.',
          logo: 'https://picsum.photos/seed/ai1/100/100',
          description: 'Cutting-edge AI solutions for enterprise',
          categories: ['AI', 'Machine Learning'],
          boothNumber: 'B-101',
        ),
        Exhibitor(
          id: 'exh_002',
          name: 'CloudTech Solutions',
          logo: 'https://picsum.photos/seed/cloud1/100/100',
          description: 'Cloud infrastructure and security',
          categories: ['Cloud', 'Security'],
          boothNumber: 'B-102',
        ),
        Exhibitor(
          id: 'exh_003',
          name: 'BlockChain Labs',
          logo: 'https://picsum.photos/seed/block1/100/100',
          description: 'Blockchain development and consulting',
          categories: ['Blockchain'],
          boothNumber: 'B-103',
        ),
        Exhibitor(
          id: 'exh_004',
          name: 'CyberSecure Inc.',
          logo: 'https://picsum.photos/seed/cyber1/100/100',
          description: 'Enterprise cybersecurity solutions',
          categories: ['Security', 'Cloud'],
          boothNumber: 'B-104',
        ),
      ],
    ),
    Expo(
      id: 'expo_002',
      title: 'Business Expo 2026',
      location: 'London, UK',
      date: DateTime(2026, 10, 5),
      description: 'The premier business expo for entrepreneurs, investors, and business leaders. Network, learn, and grow your business.',
      imageUrl: 'https://picsum.photos/seed/business1/400/200',
      exhibitorCount: 180,
      visitorCount: 3500,
      categories: ['Business', 'Entrepreneurship', 'Investment'],
      rating: 4.5,
      isFeatured: false,
      organizer: 'Business Network Global',
      schedule: [
        ExpoSchedule(
          time: '10:00 - 11:00',
          title: 'Future of Work',
          description: 'How remote work and AI are reshaping the business landscape.',
          speaker: 'James Anderson',
          location: 'Main Hall',
        ),
        ExpoSchedule(
          time: '11:30 - 13:00',
          title: 'Investment Strategies Panel',
          description: 'Top investors share insights on funding and growth.',
          speaker: 'Priya Patel',
          location: 'Conference Room A',
        ),
        ExpoSchedule(
          time: '14:00 - 16:00',
          title: 'Networking Session',
          description: 'Connect with fellow entrepreneurs and investors.',
          speaker: 'All Attendees',
          location: 'Exhibition Hall',
        ),
      ],
      exhibitors: [
        Exhibitor(
          id: 'exh_005',
          name: 'Growth Capital Partners',
          logo: 'https://picsum.photos/seed/growth1/100/100',
          description: 'Venture capital for early-stage startups',
          categories: ['Investment', 'Finance'],
          boothNumber: 'C-201',
        ),
        Exhibitor(
          id: 'exh_006',
          name: 'BizTech Solutions',
          logo: 'https://picsum.photos/seed/biztech1/100/100',
          description: 'Business automation and CRM solutions',
          categories: ['Business', 'Technology'],
          boothNumber: 'C-202',
        ),
      ],
    ),
    Expo(
      id: 'expo_003',
      title: 'AI & Data Science Summit',
      location: 'San Francisco, CA',
      date: DateTime(2026, 11, 20),
      description: 'The ultimate AI and data science event. Learn from the best in the field.',
      imageUrl: 'https://picsum.photos/seed/ai2/400/200',
      exhibitorCount: 120,
      visitorCount: 2800,
      categories: ['AI', 'Data Science', 'Machine Learning'],
      rating: 4.9,
      isFeatured: true,
      organizer: 'Data Science Academy',
      schedule: [
        ExpoSchedule(
          time: '09:00 - 10:30',
          title: 'Keynote: The Future of AI',
          description: 'Industry leaders discuss the next frontier of artificial intelligence.',
          speaker: 'Dr. Andrew Ng',
          location: 'Grand Ballroom',
        ),
        ExpoSchedule(
          time: '11:00 - 12:30',
          title: 'Deep Learning Workshop',
          description: 'Hands-on workshop on advanced deep learning techniques.',
          speaker: 'Dr. Fei-Fei Li',
          location: 'Workshop Room 1',
        ),
        ExpoSchedule(
          time: '14:00 - 15:30',
          title: 'Data Science in Production',
          description: 'Best practices for deploying ML models at scale.',
          speaker: 'Cassie Kozyrkov',
          location: 'Conference Room B',
        ),
        ExpoSchedule(
          time: '16:00 - 18:00',
          title: 'AI Networking Reception',
          description: 'Connect with AI researchers, engineers, and enthusiasts.',
          speaker: 'All Speakers',
          location: 'Exhibition Hall',
        ),
      ],
      exhibitors: [
        Exhibitor(
          id: 'exh_007',
          name: 'DeepMind Technologies',
          logo: 'https://picsum.photos/seed/deepmind1/100/100',
          description: 'Advanced AI research and development',
          categories: ['AI', 'Machine Learning'],
          boothNumber: 'D-301',
        ),
        Exhibitor(
          id: 'exh_008',
          name: 'DataRobot Inc.',
          logo: 'https://picsum.photos/seed/datarobot1/100/100',
          description: 'Automated machine learning platform',
          categories: ['Data Science', 'AI'],
          boothNumber: 'D-302',
        ),
        Exhibitor(
          id: 'exh_009',
          name: 'TensorFlow Labs',
          logo: 'https://picsum.photos/seed/tensor1/100/100',
          description: 'Open-source ML framework solutions',
          categories: ['Machine Learning', 'AI'],
          boothNumber: 'D-303',
        ),
        Exhibitor(
          id: 'exh_010',
          name: 'Kaggle Analytics',
          logo: 'https://picsum.photos/seed/kaggle1/100/100',
          description: 'Data science competitions and community',
          categories: ['Data Science', 'AI'],
          boothNumber: 'D-304',
        ),
        Exhibitor(
          id: 'exh_011',
          name: 'Hugging Face',
          logo: 'https://picsum.photos/seed/hugging1/100/100',
          description: 'NLP models and AI community platform',
          categories: ['AI', 'NLP'],
          boothNumber: 'D-305',
        ),
      ],
    ),
  ];

  // Mock Contacts
  final List<Contact> _mockContacts = [
    Contact(
      id: 'contact_001',
      name: 'Dr. Sarah Chen',
      profileImage: 'https://picsum.photos/seed/sarah/100/100',
      company: 'AI Innovations Inc.',
      position: 'CTO',
      isConnected: true,
    ),
    Contact(
      id: 'contact_002',
      name: 'Michael Rodriguez',
      profileImage: 'https://picsum.photos/seed/michael/100/100',
      company: 'CloudTech Solutions',
      position: 'VP of Engineering',
      isConnected: true,
    ),
    Contact(
      id: 'contact_003',
      name: 'Emily Watson',
      profileImage: 'https://picsum.photos/seed/emily/100/100',
      company: 'Data Science Academy',
      position: 'Lead Data Scientist',
      isConnected: false,
      isPending: true,
    ),
    Contact(
      id: 'contact_004',
      name: 'James Anderson',
      profileImage: 'https://picsum.photos/seed/james/100/100',
      company: 'Business Network Global',
      position: 'CEO',
      isConnected: false,
    ),
  ];

  // Mock Notifications
  final List<NotificationModel> _mockNotifications = [
    NotificationModel(
      id: 'notif_001',
      title: 'Event Reminder',
      message: 'TechConnect Global 2026 starts in 3 days. Prepare your networking strategy!',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.event,
      actionId: 'expo_001',
    ),
    NotificationModel(
      id: 'notif_002',
      title: 'New Connection',
      message: 'Dr. Sarah Chen has accepted your connection request.',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      type: NotificationType.connection,
    ),
    NotificationModel(
      id: 'notif_003',
      title: 'Message Received',
      message: 'Michael Rodriguez sent you a message about the upcoming workshop.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.message,
    ),
  ];

  // Mock Chat Messages
  final Map<String, List<ChatMessage>> _mockChats = {
    'contact_001': [
      ChatMessage(
        id: 'msg_001',
        senderId: 'contact_001',
        receiverId: 'user_001',
        message: 'Looking forward to seeing you at TechConnect!',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        isRead: true,
      ),
      ChatMessage(
        id: 'msg_002',
        senderId: 'user_001',
        receiverId: 'contact_001',
        message: 'Absolutely! I\'m excited about the AI panel.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isRead: true,
      ),
    ],
    'contact_002': [
      ChatMessage(
        id: 'msg_003',
        senderId: 'contact_002',
        receiverId: 'user_001',
        message: 'Hey, are you attending the cloud workshop?',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        isRead: false,
      ),
    ],
  };

  // Saved Exhibitors
  final List<String> _savedExhibitors = ['exh_001', 'exh_003'];

  // ---- Expo Methods ----

  Future<List<Expo>> getExpos() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockExpos;
  }

  Future<List<Expo>> getFeaturedExpos() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockExpos.where((e) => e.isFeatured).toList();
  }

  Future<Expo?> getExpoById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockExpos.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<Expo>> searchExpos(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (query.isEmpty) return _mockExpos;
    return _mockExpos.where((e) =>
      e.title.toLowerCase().contains(query.toLowerCase()) ||
      e.location.toLowerCase().contains(query.toLowerCase()) ||
      e.categories.any((c) => c.toLowerCase().contains(query.toLowerCase()))
    ).toList();
  }

  Future<List<Expo>> getExposByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (category.isEmpty) return _mockExpos;
    return _mockExpos.where((e) => 
      e.categories.any((c) => c.toLowerCase() == category.toLowerCase())
    ).toList();
  }

  // ---- Contact Methods ----

  Future<List<Contact>> getContacts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockContacts;
  }

  Future<List<Contact>> getConnectedContacts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockContacts.where((c) => c.isConnected).toList();
  }

  Future<List<Contact>> getPendingContacts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockContacts.where((c) => c.isPending).toList();
  }

  Future<void> connectWithContact(String contactId) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockContacts.indexWhere((c) => c.id == contactId);
    if (index != -1) {
      _mockContacts[index] = _mockContacts[index].copyWith(
        isPending: true,
      );
    }
  }

  Future<void> acceptConnection(String contactId) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockContacts.indexWhere((c) => c.id == contactId);
    if (index != -1) {
      _mockContacts[index] = _mockContacts[index].copyWith(
        isConnected: true,
        isPending: false,
      );
    }
  }

  // ---- Chat Methods ----

  Future<List<ChatMessage>> getChatMessages(String contactId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockChats[contactId] ?? [];
  }

  Future<void> sendMessage({
    required String contactId,
    required String message,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newMessage = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      senderId: 'user_001',
      receiverId: contactId,
      message: message,
      timestamp: DateTime.now(),
      isRead: false,
    );
    if (_mockChats.containsKey(contactId)) {
      _mockChats[contactId]!.add(newMessage);
    } else {
      _mockChats[contactId] = [newMessage];
    }
  }

  // ---- Notification Methods ----

  Future<List<NotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockNotifications;
  }

  Future<List<NotificationModel>> getUnreadNotifications() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockNotifications.where((n) => !n.isRead).toList();
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _mockNotifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _mockNotifications[index] = _mockNotifications[index].copyWith(isRead: true);
    }
  }

  Future<void> markAllNotificationsAsRead() async {
    await Future.delayed(const Duration(milliseconds: 300));
    for (int i = 0; i < _mockNotifications.length; i++) {
      _mockNotifications[i] = _mockNotifications[i].copyWith(isRead: true);
    }
  }

  // ---- Saved Exhibitors Methods ----

  Future<List<String>> getSavedExhibitorIds() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _savedExhibitors;
  }

  Future<void> saveExhibitor(String exhibitorId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (!_savedExhibitors.contains(exhibitorId)) {
      _savedExhibitors.add(exhibitorId);
    }
  }

  Future<void> unsaveExhibitor(String exhibitorId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _savedExhibitors.remove(exhibitorId);
  }

  Future<bool> isExhibitorSaved(String exhibitorId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _savedExhibitors.contains(exhibitorId);
  }

  Future<List<Exhibitor>> getSavedExhibitors() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final allExhibitors = <Exhibitor>[];
    for (final expo in _mockExpos) {
      allExhibitors.addAll(expo.exhibitors);
    }
    return allExhibitors.where((e) => _savedExhibitors.contains(e.id)).toList();
  }
}