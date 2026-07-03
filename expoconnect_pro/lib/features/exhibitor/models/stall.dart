import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Stall extends Equatable {
  final String id;
  final String expoId;
  final String boothNumber;
  final String location;
  final double size;
  final bool isPremium;
  final String? layoutImageUrl;
  final int visitorCount;
  final int leadCount;
  final List<StallAmenity> amenities;

  const Stall({
    required this.id,
    required this.expoId,
    required this.boothNumber,
    required this.location,
    required this.size,
    this.isPremium = false,
    this.layoutImageUrl,
    this.visitorCount = 0,
    this.leadCount = 0,
    this.amenities = const [],
  });

  Stall copyWith({
    String? id,
    String? expoId,
    String? boothNumber,
    String? location,
    double? size,
    bool? isPremium,
    String? layoutImageUrl,
    int? visitorCount,
    int? leadCount,
    List<StallAmenity>? amenities,
  }) {
    return Stall(
      id: id ?? this.id,
      expoId: expoId ?? this.expoId,
      boothNumber: boothNumber ?? this.boothNumber,
      location: location ?? this.location,
      size: size ?? this.size,
      isPremium: isPremium ?? this.isPremium,
      layoutImageUrl: layoutImageUrl ?? this.layoutImageUrl,
      visitorCount: visitorCount ?? this.visitorCount,
      leadCount: leadCount ?? this.leadCount,
      amenities: amenities ?? this.amenities,
    );
  }

  @override
  List<Object?> get props => [
        id,
        expoId,
        boothNumber,
        location,
        size,
        isPremium,
        layoutImageUrl,
        visitorCount,
        leadCount,
        amenities,
      ];
}

class StallAmenity extends Equatable {
  final String id;
  final String name;
  final IconData icon;

  const StallAmenity({
    required this.id,
    required this.name,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, name, icon];
}