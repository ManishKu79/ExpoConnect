import 'package:equatable/equatable.dart';

class Lead extends Equatable {
  final String id;
  final String visitorId;
  final String visitorName;
  final String? visitorEmail;
  final String? visitorPhone;
  final String company;
  final String position;
  final String? profileImage;
  final DateTime timestamp;
  final LeadStatus status;
  final double? score;
  final List<String> interests;
  final String? notes;

  const Lead({
    required this.id,
    required this.visitorId,
    required this.visitorName,
    this.visitorEmail,
    this.visitorPhone,
    required this.company,
    required this.position,
    this.profileImage,
    required this.timestamp,
    this.status = LeadStatus.newLead,
    this.score,
    this.interests = const [],
    this.notes,
  });

  Lead copyWith({
    String? id,
    String? visitorId,
    String? visitorName,
    String? visitorEmail,
    String? visitorPhone,
    String? company,
    String? position,
    String? profileImage,
    DateTime? timestamp,
    LeadStatus? status,
    double? score,
    List<String>? interests,
    String? notes,
  }) {
    return Lead(
      id: id ?? this.id,
      visitorId: visitorId ?? this.visitorId,
      visitorName: visitorName ?? this.visitorName,
      visitorEmail: visitorEmail ?? this.visitorEmail,
      visitorPhone: visitorPhone ?? this.visitorPhone,
      company: company ?? this.company,
      position: position ?? this.position,
      profileImage: profileImage ?? this.profileImage,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      score: score ?? this.score,
      interests: interests ?? this.interests,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        id,
        visitorId,
        visitorName,
        visitorEmail,
        visitorPhone,
        company,
        position,
        profileImage,
        timestamp,
        status,
        score,
        interests,
        notes,
      ];
}

enum LeadStatus {
  newLead,
  contacted,
  meetingScheduled,
  negotiation,
  won,
  lost,
}