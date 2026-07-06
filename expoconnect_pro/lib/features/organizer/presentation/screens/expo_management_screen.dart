import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/organizer_providers.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';
import '../../../../routes/route_names.dart';
import '../../models/organizer_expo.dart'; // ADD THIS IMPORT

class ExpoManagementScreen extends ConsumerStatefulWidget {
  const ExpoManagementScreen({super.key});

  @override
  ConsumerState<ExpoManagementScreen> createState() => _ExpoManagementScreenState();
}

class _ExpoManagementScreenState extends ConsumerState<ExpoManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final expos = ref.watch(organizerExposProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Expo Management',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () {
            context.go(RouteNames.organizerDashboard);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: expos.when(
        data: (expos) {
          if (expos.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_rounded,
                    size: 72,
                    color: AppColors.textTertiary,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No expos created',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create your first expo to get started',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: expos.length,
            itemBuilder: (context, index) {
              final expo = expos[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowLight,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceAlt,
                            borderRadius: BorderRadius.circular(12),
                            image: expo.imageUrl != null
                                ? DecorationImage(
                                    image: NetworkImage(expo.imageUrl!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: expo.imageUrl == null
                              ? Icon(Icons.event, color: AppColors.textTertiary, size: 30)
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                expo.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                expo.location,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getStatusColor(expo.status).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            expo.status.toString().split('.').last,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _getStatusColor(expo.status),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.people_rounded,
                          color: AppColors.textTertiary,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${expo.visitorCount} visitors',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.business_rounded,
                          color: AppColors.textTertiary,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${expo.exhibitorCount} exhibitors',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '\$${(expo.revenue / 1000).toStringAsFixed(1)}K',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.success,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stack) => Center(
          child: Text(
            'Failed to load expos',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.error,
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(ExpoStatus status) {
    switch (status) {
      case ExpoStatus.draft:
        return AppColors.textTertiary;
      case ExpoStatus.published:
        return AppColors.info;
      case ExpoStatus.ongoing:
        return AppColors.secondary;
      case ExpoStatus.completed:
        return AppColors.success;
      case ExpoStatus.cancelled:
        return AppColors.error;
      default:
        return AppColors.textTertiary;
    }
  }
}