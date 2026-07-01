import 'package:equatable/equatable.dart';

class Expo extends Equatable {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final String description;
  final String? imageUrl;
  final int exhibitorCount;
  final int visitorCount;
  final List<String> categories;
  final double rating;
  final bool isFeatured;
  final String organizer;
  final List<ExpoSchedule> schedule;
  final List<Exhibitor> exhibitors;

  const Expo({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.description,
    this.imageUrl,
    this.exhibitorCount = 0,
    this.visitorCount = 0,
    this.categories = const [],
    this.rating = 0.0,
    this.isFeatured = false,
    this.organizer = '',
    this.schedule = const [],
    this.exhibitors = const [],
  });

  Expo copyWith({
    String? id,
    String? title,
    String? location,
    DateTime? date,
    String? description,
    String? imageUrl,
    int? exhibitorCount,
    int? visitorCount,
    List<String>? categories,
    double? rating,
    bool? isFeatured,
    String? organizer,
    List<ExpoSchedule>? schedule,
    List<Exhibitor>? exhibitors,
  }) {
    return Expo(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      exhibitorCount: exhibitorCount ?? this.exhibitorCount,
      visitorCount: visitorCount ?? this.visitorCount,
      categories: categories ?? this.categories,
      rating: rating ?? this.rating,
      isFeatured: isFeatured ?? this.isFeatured,
      organizer: organizer ?? this.organizer,
      schedule: schedule ?? this.schedule,
      exhibitors: exhibitors ?? this.exhibitors,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        location,
        date,
        description,
        imageUrl,
        exhibitorCount,
        visitorCount,
        categories,
        rating,
        isFeatured,
        organizer,
        schedule,
        exhibitors,
      ];
}

class ExpoSchedule extends Equatable {
  final String time;
  final String title;
  final String description;
  final String speaker;
  final String location;

  const ExpoSchedule({
    required this.time,
    required this.title,
    required this.description,
    required this.speaker,
    required this.location,
  });

  @override
  List<Object?> get props => [time, title, description, speaker, location];
}

class Exhibitor extends Equatable {
  final String id;
  final String name;
  final String? logo;
  final String description;
  final List<String> categories;
  final String boothNumber;
  final bool isStarred;

  const Exhibitor({
    required this.id,
    required this.name,
    this.logo,
    required this.description,
    this.categories = const [],
    required this.boothNumber,
    this.isStarred = false,
  });

  Exhibitor copyWith({
    String? id,
    String? name,
    String? logo,
    String? description,
    List<String>? categories,
    String? boothNumber,
    bool? isStarred,
  }) {
    return Exhibitor(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      boothNumber: boothNumber ?? this.boothNumber,
      isStarred: isStarred ?? this.isStarred,
    );
  }

  @override
  List<Object?> get props => [id, name, logo, description, categories, boothNumber, isStarred];
}