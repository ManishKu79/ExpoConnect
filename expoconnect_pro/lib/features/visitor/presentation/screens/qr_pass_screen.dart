import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';
import '../../../../routes/route_names.dart';

class QRPassScreen extends StatelessWidget {
  const QRPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My QR Pass',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowMedium,
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.qr_code_scanner_rounded,
                    size: 160,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Your Digital Pass',
                style: AppTypography.headline2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Scan this QR code at the entrance to access the event',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.secondary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: AppColors.secondary,
                      size: 24,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'This pass is valid for TechConnect Global 2026',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}