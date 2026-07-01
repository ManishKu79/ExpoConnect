import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/auth_providers.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';
import '../../../../routes/route_names.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _reminders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () {
            // Use go() instead of pop() for root navigation
            context.go(RouteNames.home);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            _buildSettingsSection(
              title: 'APPEARANCE',
              children: [
                _buildSwitchTile(
                  icon: Icons.dark_mode_rounded,
                  title: 'Dark Mode',
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSettingsSection(
              title: 'NOTIFICATIONS',
              children: [
                _buildSwitchTile(
                  icon: Icons.notifications_rounded,
                  title: 'Push Notifications',
                  value: _notifications,
                  onChanged: (value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.alarm_rounded,
                  title: 'Event Reminders',
                  value: _reminders,
                  onChanged: (value) {
                    setState(() {
                      _reminders = value;
                    });
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSettingsSection(
              title: 'ACCOUNT',
              children: [
                _buildTile(
                  icon: Icons.person_outline_rounded,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                _buildTile(
                  icon: Icons.lock_outline_rounded,
                  title: 'Privacy & Security',
                  onTap: () {},
                ),
                _buildTile(
                  icon: Icons.data_usage_rounded,
                  title: 'Data & Storage',
                  onTap: () {},
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSettingsSection(
              title: 'ABOUT',
              children: [
                _buildTile(
                  icon: Icons.info_outline_rounded,
                  title: 'App Version',
                  trailing: '1.0.0',
                  onTap: () {},
                ),
                _buildTile(
                  icon: Icons.description_rounded,
                  title: 'Terms of Service',
                  onTap: () {},
                ),
                _buildTile(
                  icon: Icons.privacy_tip_rounded,
                  title: 'Privacy Policy',
                  onTap: () {},
                ),
              ],
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textTertiary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    String? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary, size: 24),
      title: Text(
        title,
        style: AppTypography.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing != null
          ? Text(
              trailing,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textTertiary,
                fontWeight: FontWeight.w500,
              ),
            )
          : Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textTertiary,
            ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary, size: 24),
      title: Text(
        title,
        style: AppTypography.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.secondary,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}