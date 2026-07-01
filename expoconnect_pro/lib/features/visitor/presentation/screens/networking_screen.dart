import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/visitor_providers.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';
import '../../../../routes/route_names.dart';

class NetworkingScreen extends ConsumerStatefulWidget {
  const NetworkingScreen({super.key});

  @override
  ConsumerState<NetworkingScreen> createState() => _NetworkingScreenState();
}

class _NetworkingScreenState extends ConsumerState<NetworkingScreen> {
  int _selectedTab = 0;

  final List<String> _tabs = ['Connections', 'Pending', 'All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Network',
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
            icon: const Icon(Icons.qr_code_scanner_rounded, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
            child: TabBar(
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
              onTap: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
              indicator: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.secondary,
              unselectedLabelColor: AppColors.textSecondary,
              labelStyle: AppTypography.labelLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: AppTypography.labelMedium.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          Expanded(
            child: _selectedTab == 0
                ? _buildConnectedContacts()
                : _selectedTab == 1
                    ? _buildPendingContacts()
                    : _buildAllContacts(),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedContacts() {
    final contacts = ref.watch(connectedContactsProvider);
    return _buildContactList(contacts, isConnected: true);
  }

  Widget _buildPendingContacts() {
    final contacts = ref.watch(pendingContactsProvider);
    return _buildContactList(contacts, isPending: true);
  }

  Widget _buildAllContacts() {
    final contacts = ref.watch(contactsProvider);
    return _buildContactList(contacts);
  }

  Widget _buildContactList(
    AsyncValue<List<dynamic>> contacts, {
    bool isConnected = false,
    bool isPending = false,
  }) {
    return contacts.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isConnected
                      ? Icons.people_outline_rounded
                      : isPending
                          ? Icons.hourglass_empty_rounded
                          : Icons.person_search_rounded,
                  size: 72,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(height: 20),
                Text(
                  isConnected
                      ? 'No connections yet'
                      : isPending
                          ? 'No pending requests'
                          : 'No contacts found',
                  style: AppTypography.headline3,
                ),
                const SizedBox(height: 8),
                Text(
                  isConnected
                      ? 'Start networking to build your connections'
                      : isPending
                          ? 'You have no pending connection requests'
                          : 'Connect with professionals at events',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final contact = items[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
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
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceAlt,
                      shape: BoxShape.circle,
                      image: contact.profileImage != null
                          ? DecorationImage(
                              image: NetworkImage(contact.profileImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: contact.profileImage == null
                        ? Icon(
                            Icons.person_rounded,
                            color: AppColors.textTertiary,
                            size: 32,
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.name ?? '',
                          style: AppTypography.headline5.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          contact.position ?? '',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          contact.company ?? '',
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.textTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isConnected)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.success,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Connected',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isPending)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.warning.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Pending',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  if (!isConnected && !isPending)
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        minimumSize: const Size(0, 0),
                        elevation: 0,
                      ),
                      child: Text(
                        'Connect',
                        style: AppTypography.labelMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
          'Failed to load contacts',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}