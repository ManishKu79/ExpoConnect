import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/organizer_providers.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';
import '../../../../routes/route_names.dart';

class OrganizerDashboardScreen extends ConsumerStatefulWidget {
  const OrganizerDashboardScreen({super.key});

  @override
  ConsumerState<OrganizerDashboardScreen> createState() => _OrganizerDashboardScreenState();
}

class _OrganizerDashboardScreenState extends ConsumerState<OrganizerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(organizerProfileProvider);
    final analytics = ref.watch(organizerAnalyticsProvider);
    final expos = ref.watch(organizerExposProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Organizer Dashboard',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () {
            context.go(RouteNames.home);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: AppColors.textPrimary),
            onPressed: () {
              context.go(RouteNames.notifications);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            profile.when(
              data: (profile) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowLight,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        shape: BoxShape.circle,
                        image: profile.profileImage != null
                            ? DecorationImage(
                                image: NetworkImage(profile.profileImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: profile.profileImage == null
                          ? Icon(Icons.person, size: 30, color: AppColors.textTertiary)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.name,
                            style: AppTypography.headline4.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            profile.company,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          if (profile.isVerified)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.verified_rounded,
                                    color: AppColors.success,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Verified Organizer',
                                    style: AppTypography.labelSmall.copyWith(
                                      color: AppColors.success,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => const SizedBox(),
            ),
            
            const SizedBox(height: 20),
            
            // Stats Cards
            analytics.when(
              data: (data) => Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      title: 'Expos',
                      value: data.totalExpos.toString(),
                      icon: Icons.event_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      title: 'Visitors',
                      value: data.totalVisitors.toString(),
                      icon: Icons.people_rounded,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      title: 'Revenue',
                      value: '\$${(data.totalRevenue / 1000).toStringAsFixed(1)}K',
                      icon: Icons.attach_money_rounded,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => const SizedBox(),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            const Text(
              'Quick Actions',
              style: AppTypography.headline4,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildQuickAction(
                  icon: Icons.add_rounded,
                  label: 'Create Expo',
                  onTap: () {
                    // Navigate to create expo
                  },
                ),
                const SizedBox(width: 12),
                _buildQuickAction(
                  icon: Icons.people_rounded,
                  label: 'Visitors',
                  onTap: () {
                    context.go(RouteNames.visitorManagement);
                  },
                ),
                const SizedBox(width: 12),
                _buildQuickAction(
                  icon: Icons.storefront_rounded,
                  label: 'Stalls',
                  onTap: () {
                    context.go(RouteNames.stallAllocation);
                  },
                ),
                const SizedBox(width: 12),
                _buildQuickAction(
                  icon: Icons.analytics_rounded,
                  label: 'Analytics',
                  onTap: () {
                    context.go(RouteNames.liveAnalytics);
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Recent Expos
            expos.when(
              data: (expos) {
                if (expos.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Expos',
                          style: AppTypography.headline4,
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(RouteNames.expoManagement);
                          },
                          child: Text(
                            'See All',
                            style: AppTypography.labelMedium.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: expos.length > 3 ? 3 : expos.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final expo = expos[index];
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowLight,
                                blurRadius: 8