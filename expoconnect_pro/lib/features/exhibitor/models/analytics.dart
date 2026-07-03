import 'package:equatable/equatable.dart';

class ExhibitorAnalytics extends Equatable {
  final int totalVisitors;
  final int totalLeads;
  final double conversionRate;
  final int meetingsScheduled;
  final int demosGiven;
  final double avgEngagementTime;
  final Map<String, int> visitorByHour;
  final Map<String, int> leadBySource;
  final List<DailyStat> dailyStats;

  const ExhibitorAnalytics({
    required this.totalVisitors,
    required this.totalLeads,
    required this.conversionRate,
    required this.meetingsScheduled,
    required this.demosGiven,
    required this.avgEngagementTime,
    this.visitorByHour = const {},
    this.leadBySource = const {},
    this.dailyStats = const [],
  });

  @override
  List<Object?> get props => [
        totalVisitors,
        totalLeads,
        conversionRate,
        meetingsScheduled,
        demosGiven,
        avgEngagementTime,
        visitorByHour,
        leadBySource,
        dailyStats,
      ];
}

class DailyStat extends Equatable {
  final DateTime date;
  final int visitors;
  final int leads;

  const DailyStat({
    required this.date,
    required this.visitors,
    required this.leads,
  });

  @override
  List<Object?> get props => [date, visitors, leads];
}

class Report extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime generatedAt;
  final ReportType type;
  final String fileUrl;

  const Report({
    required this.id,
    required this.title,
    required this.description,
    required this.generatedAt,
    required this.type,
    required this.fileUrl,
  });

  @override
  List<Object?> get props => [id, title, description, generatedAt, type, fileUrl];
}

enum ReportType {
  leadSummary,
  visitorAnalytics,
  boothPerformance,
  competitorAnalysis,
}