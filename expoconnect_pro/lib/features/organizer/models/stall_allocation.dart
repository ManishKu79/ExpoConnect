import 'package:equatable/equatable.dart';

class StallAllocation extends Equatable {
  final String id;
  final String expoId;
  final String exhibitorId;
  final String exhibitorName;
  final String boothNumber;
  final String location;
  final double size;
  final bool isPremium;
  final double price;
  final StallStatus status;
  final DateTime allocatedAt;

  const StallAllocation({
    required this.id,
    required this.expoId,
    required this.exhibitorId,
    required this.exhibitorName,
    required this.boothNumber,
    required this.location,
    required this.size,
    this.isPremium = false,
    this.price = 0.0,
    this.status = StallStatus.available,
    required this.allocatedAt,
  });

  StallAllocation copyWith({
    String? id,
    String? expoId,
    String? exhibitorId,
    String? exhibitorName,
    String? boothNumber,
    String? location,
    double? size,
    bool? isPremium,
    double? price,
    StallStatus? status,
    DateTime? allocatedAt,
  }) {
    return StallAllocation(
      id: id ?? this.id,
      expoId: expoId ?? this.expoId,
      exhibitorId: exhibitorId ?? this.exhibitorId,
      exhibitorName: exhibitorName ?? this.exhibitorName,
      boothNumber: boothNumber ?? this.boothNumber,
      location: location ?? this.location,
      size: size ?? this.size,
      isPremium: isPremium ?? this.isPremium,
      price: price ?? this.price,
      status: status ?? this.status,
      allocatedAt: allocatedAt ?? this.allocatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        expoId,
        exhibitorId,
        exhibitorName,
        boothNumber,
        location,
        size,
        isPremium,
        price,
        status,
        allocatedAt,
      ];
}

enum StallStatus {
  available,
  reserved,
  confirmed,
  occupied,
}