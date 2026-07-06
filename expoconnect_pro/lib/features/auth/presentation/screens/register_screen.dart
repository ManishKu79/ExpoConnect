import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/auth_providers.dart';
import '../../../../routes/route_names.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;
  String _selectedRole = 'visitor';
  
  bool _isNameFocused = false;
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isConfirmPasswordFocused = false;

  final List<Map<String, dynamic>> _roles = [
    {
      'value': 'visitor',
      'label': 'Visitor',
      'icon': Icons.person_rounded,
      'description': 'Attend expos, network, and explore',
      'color': AppColors.primary,
    },
    {
      'value': 'exhibitor',
      'label': 'Exhibitor',
      'icon': Icons.storefront_rounded,
      'description': 'Showcase your products and generate leads',
      'color': AppColors.secondary,
    },
    {
      'value': 'organizer',
      'label': 'Organizer',
      'icon': Icons.event_rounded,
      'description': 'Organize expos and manage attendees',
      'color': AppColors.accent,
    },
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.background,
              AppColors.surfaceAlt,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowLight,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 22,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: AppTypography.heroMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Choose your role and join the network',
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 36),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECT YOUR ROLE',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: _roles.map((role) {
                        final isSelected = _selectedRole == role['value'];
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRole = role['value'];
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected 
                                    ? (role['color'] as Color).withOpacity(0.1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected 
                                      ? role['color'] as Color
                                      : AppColors.border,
                                  width: isSelected ? 2 : 1,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: (role['color'] as Color).withOpacity(0.2),
                                          blurRadius: 12,
                                          spreadRadius: 4,
                                        ),
                                      ]
                                    : [
                                        BoxShadow(
                                          color: AppColors.shadowLight,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    role['icon'],
                                    color: isSelected 
                                        ? role['color'] as Color
                                        : AppColors.textTertiary,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    role['label'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: isSelected 
                                          ? FontWeight.w700 
                                          : FontWeight.w500,
                                      color: isSelected 
                                          ? role['color'] as Color
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                  Text(
                                    role['description'],
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: isSelected 
                                          ? (role['color'] as Color)
                                          : AppColors.textTertiary,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                
                const SizedBox(height: 28),
                
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FULL NAME',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1430),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _isNameFocused 
                                    ? AppColors.secondary 
                                    : AppColors.darkBorder,
                                width: _isNameFocused ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _isNameFocused 
                                      ? AppColors.shadowGold 
                                      : AppColors.shadowLight,
                                  blurRadius: _isNameFocused ? 20 : 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'John Doe',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF7A6A90),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 18,
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: _isNameFocused 
                                      ? AppColors.secondary 
                                      : const Color(0xFF7A6A90),
                                  size: 22,
                                ),
                                errorStyle: const TextStyle(
                                  color: Color(0xFFE74C3C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                errorMaxLines: 2,
                              ),
                              onTap: () {
                                setState(() {
                                  _isNameFocused = true;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMAIL ADDRESS',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1430),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _isEmailFocused 
                                    ? AppColors.secondary 
                                    : AppColors.darkBorder,
                                width: _isEmailFocused ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _isEmailFocused 
                                      ? AppColors.shadowGold 
                                      : AppColors.shadowLight,
                                  blurRadius: _isEmailFocused ? 20 : 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'you@example.com',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF7A6A90),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 18,
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: _isEmailFocused 
                                      ? AppColors.secondary 
                                      : const Color(0xFF7A6A90),
                                  size: 22,
                                ),
                                errorStyle: const TextStyle(
                                  color: Color(0xFFE74C3C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                errorMaxLines: 2,
                              ),
                              onTap: () {
                                setState(() {
                                  _isEmailFocused = true;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PASSWORD',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1430),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _isPasswordFocused 
                                    ? AppColors.secondary 
                                    : AppColors.darkBorder,
                                width: _isPasswordFocused ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _isPasswordFocused 
                                      ? AppColors.shadowGold 
                                      : AppColors.shadowLight,
                                  blurRadius: _isPasswordFocused ? 20 : 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Create a strong password',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF7A6A90),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 18,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: _isPasswordFocused 
                                      ? AppColors.secondary 
                                      : const Color(0xFF7A6A90),
                                  size: 22,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: const Color(0xFF7A6A90),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                errorStyle: const TextStyle(
                                  color: Color(0xFFE74C3C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                errorMaxLines: 2,
                              ),
                              onTap: () {
                                setState(() {
                                  _isPasswordFocused = true;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CONFIRM PASSWORD',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1430),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _isConfirmPasswordFocused 
                                    ? AppColors.secondary 
                                    : AppColors.darkBorder,
                                width: _isConfirmPasswordFocused ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _isConfirmPasswordFocused 
                                      ? AppColors.shadowGold 
                                      : AppColors.shadowLight,
                                  blurRadius: _isConfirmPasswordFocused ? 20 : 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscureConfirmPassword,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Re-enter your password',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF7A6A90),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 18,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: _isConfirmPasswordFocused 
                                      ? AppColors.secondary 
                                      : const Color(0xFF7A6A90),
                                  size: 22,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: const Color(0xFF7A6A90),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureConfirmPassword =
                                          !_obscureConfirmPassword;
                                    });
                                  },
                                ),
                                errorStyle: const TextStyle(
                                  color: Color(0xFFE74C3C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                errorMaxLines: 2,
                              ),
                              onTap: () {
                                setState(() {
                                  _isConfirmPasswordFocused = true;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: _agreeTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreeTerms = value ?? false;
                                });
                              },
                              activeColor: AppColors.secondary,
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: AppColors.darkBorder,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _agreeTerms = !_agreeTerms;
                                });
                              },
                              child: Text(
                                'I agree to the Terms of Service and Privacy Policy',
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      if (!_agreeTerms && _formKey.currentState?.validate() == false)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 40),
                          child: Text(
                            'Please agree to the terms to continue',
                            style: const TextStyle(
                              color: Color(0xFFE74C3C),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      
                      const SizedBox(height: 32),
                      
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: AppColors.premiumGradient,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowGold,
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: authState.isLoading ? null : _handleRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: authState.isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: Colors.white,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Create Account',
                                      style: AppTypography.buttonLarge.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 28),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    TextButton(
                      onPressed: () {
                        context.go(RouteNames.login);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                      child: Text(
                        'Sign In',
                        style: AppTypography.labelLarge.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleRegister() async {
    if (!_agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Please agree to the Terms of Service and Privacy Policy',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }
    
    if (_formKey.currentState!.validate()) {
      try {
        await ref.read(authProvider.notifier).register(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
          role: _selectedRole,
        );
        if (mounted) {
          switch (_selectedRole) {
            case 'exhibitor':
              context.go(RouteNames.exhibitorDashboard);
              break;
            case 'organizer':
              context.go(RouteNames.organizerDashboard);
              break;
            default:
              context.go(RouteNames.home);
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: AppColors.error,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      }
    }
  }
}