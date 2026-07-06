import 'package:equatable/equatable.dart';

class OrganizerProfile extends Equatable {
  final String id;
  final String name;
  final String? profileImage;
  final String company;
  final String email;
  final String phone;
  final bool isVerified;
  final int totalExpos;
  final int totalVisitors;
  final int totalExhibitors;
  final DateTime joinedAt;

  const OrganizerProfile({
    required this.id,
    required this.name,
    this.profileImage,
    required this.company,
    required this.email,
    required this.phone,
    this.isVerified = false,
    this.totalExpos = 0,
    this.totalVisitors = 0,
    this.totalExhibitors = 0,
    required this.joinedAt,
  });

  OrganizerProfile copyWith({
    String? id,
    String? name,
    String? profileImage,
    String? company,
    String? email,
    String? phone,
    bool? isVerified,
    int? totalExpos,
    int? totalVisitors,
    int? totalExhibitors,
    DateTime? joinedAt,
  }) {
    return OrganizerProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      company: company ?? this.company,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isVerified: isVerified ?? this.isVerified,
      totalExpos: totalExpos ?? this.totalExpos,
      totalVisitors: totalVisitors ?? this.totalVisitors,
      totalExhibitors: totalExhibitors ?? this.totalExhibitors,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        profileImage,
        company,
        email,
        phone,
        isVerified,
        totalExpos,
        totalVisitors,
        totalExhibitors,
        joinedAt,
      ];
}