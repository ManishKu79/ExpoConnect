import 'package:equatable/equatable.dart';

class ExhibitorProfile extends Equatable {
  final String id;
  final String companyName;
  final String? logoUrl;
  final String description;
  final String website;
  final String industry;
  final String boothNumber;
  final String expoId;
  final String contactEmail;
  final String contactPhone;
  final bool isVerified;
  final List<String> socialLinks;

  const ExhibitorProfile({
    required this.id,
    required this.companyName,
    this.logoUrl,
    required this.description,
    required this.website,
    required this.industry,
    required this.boothNumber,
    required this.expoId,
    required this.contactEmail,
    required this.contactPhone,
    this.isVerified = false,
    this.socialLinks = const [],
  });

  ExhibitorProfile copyWith({
    String? id,
    String? companyName,
    String? logoUrl,
    String? description,
    String? website,
    String? industry,
    String? boothNumber,
    String? expoId,
    String? contactEmail,
    String? contactPhone,
    bool? isVerified,
    List<String>? socialLinks,
  }) {
    return ExhibitorProfile(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      website: website ?? this.website,
      industry: industry ?? this.industry,
      boothNumber: boothNumber ?? this.boothNumber,
      expoId: expoId ?? this.expoId,
      contactEmail: contactEmail ?? this.contactEmail,
      contactPhone: contactPhone ?? this.contactPhone,
      isVerified: isVerified ?? this.isVerified,
      socialLinks: socialLinks ?? this.socialLinks,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyName,
        logoUrl,
        description,
        website,
        industry,
        boothNumber,
        expoId,
        contactEmail,
        contactPhone,
        isVerified,
        socialLinks,
      ];
}