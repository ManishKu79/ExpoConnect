import 'package:equatable/equatable.dart';

class OrganizerAnalytics extends Equatable {
  final int totalVisitors;
  final int totalExhibitors;
  final int totalExpos;
  final int activeExpos;
  final double totalRevenue;
  final double averageAttendance;
  final double averageExhibitorCount;
  final double growthRate;
  final List<DailyAnalytics> dailyStats;
  final Map<String, int> visitorByCategory;
  final Map<String, double> revenueByExpo;

  const OrganizerAnalytics({
    required this.totalVisitors,
    required this.totalExhibitors,
    required this.totalExpos,
    required this.activeExpos,
    required this.totalRevenue,
    required this.averageAttendance,
    required this.averageExhibitorCount,
    required this.growthRate,
    this.dailyStats = const [],
    this.visitorByCategory = const {},
    this.revenueByExpo = const {},
  });

  @override
  List<Object?> get props => [
        totalVisitors,
        totalExhibitors,
        totalExpos,
        activeExpos,
        totalRevenue,
        averageAttendance,
        averageExhibitorCount,
        growthRate,
        dailyStats,
        visitorByCategory,
        revenueByExpo,
      ];
}

class DailyAnalytics extends Equatable {
  final DateTime date;
  final int visitors;
  final int exhibitors;
  final double revenue;

  const DailyAnalytics({
    required this.date,
    required this.visitors,
    required this.exhibitors,
    required this.revenue,
  });

  @override
  List<Object?> get props => [date, visitors, exhibitors, revenue];
}