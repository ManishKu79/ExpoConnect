import 'package:equatable/equatable.dart';

class OrganizerVisitor extends Equatable {
  final String id;
  final String name;
  final String? profileImage;
  final String email;
  final String? phone;
  final String company;
  final String position;
  final DateTime registeredAt;
  final DateTime? lastActive;
  final int eventsAttended;
  final int connections;
  final bool isActive;

  const OrganizerVisitor({
    required this.id,
    required this.name,
    this.profileImage,
    required this.email,
    this.phone,
    required this.company,
    required this.position,
    required this.registeredAt,
    this.lastActive,
    this.eventsAttended = 0,
    this.connections = 0,
    this.isActive = true,
  });

  OrganizerVisitor copyWith({
    String? id,
    String? name,
    String? profileImage,
    String? email,
    String? phone,
    String? company,
    String? position,
    DateTime? registeredAt,
    DateTime? lastActive,
    int? eventsAttended,
    int? connections,
    bool? isActive,
  }) {
    return OrganizerVisitor(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      company: company ?? this.company,
      position: position ?? this.position,
      registeredAt: registeredAt ?? this.registeredAt,
      lastActive: lastActive ?? this.lastActive,
      eventsAttended: eventsAttended ?? this.eventsAttended,
      connections: connections ?? this.connections,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        profileImage,
        email,
        phone,
        company,
        position,
        registeredAt,
        lastActive,
        eventsAttended,
        connections,
        isActive,
      ];
}