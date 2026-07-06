import 'package:equatable/equatable.dart';

class OrganizerExpo extends Equatable {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final DateTime endDate;
  final String description;
  final String? imageUrl;
  final int visitorCount;
  final int exhibitorCount;
  final int stallCount;
  final ExpoStatus status;
  final double revenue;
  final double budget;
  final List<String> categories;

  const OrganizerExpo({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.endDate,
    required this.description,
    this.imageUrl,
    this.visitorCount = 0,
    this.exhibitorCount = 0,
    this.stallCount = 0,
    this.status = ExpoStatus.draft,
    this.revenue = 0.0,
    this.budget = 0.0,
    this.categories = const [],
  });

  OrganizerExpo copyWith({
    String? id,
    String? title,
    String? location,
    DateTime? date,
    DateTime? endDate,
    String? description,
    String? imageUrl,
    int? visitorCount,
    int? exhibitorCount,
    int? stallCount,
    ExpoStatus? status,
    double? revenue,
    double? budget,
    List<String>? categories,
  }) {
    return OrganizerExpo(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      visitorCount: visitorCount ?? this.visitorCount,
      exhibitorCount: exhibitorCount ?? this.exhibitorCount,
      stallCount: stallCount ?? this.stallCount,
      status: status ?? this.status,
      revenue: revenue ?? this.revenue,
      budget: budget ?? this.budget,
      categories: categories ?? this.categories,
    );
  }

  double get profit => revenue - budget;
  double get occupancyRate => stallCount > 0 ? (exhibitorCount / stallCount) * 100 : 0;

  @override
  List<Object?> get props => [
        id,
        title,
        location,
        date,
        endDate,
        description,
        imageUrl,
        visitorCount,
        exhibitorCount,
        stallCount,
        status,
        revenue,
        budget,
        categories,
      ];
}

enum ExpoStatus {
  draft,
  published,
  ongoing,
  completed,
  cancelled,
}