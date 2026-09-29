import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../theme/bloc/theme_event.dart';
import '../../theme/bloc/theme_state.dart';
import '../../../core/widgets/responsive_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final horizontalPadding = ResponsiveLayout.getHorizontalPadding(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 16,
        ),
        child: Column(
          children: [
            // User Info Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                      child: Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Alex Morgan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'PRO',
                                  style: TextStyle(
                                    color: Colors.amber.shade900,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'alex.morgan@example.com',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Member since Jan 2024',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Settings & Preferences
            Card(
              child: Column(
                children: [
                  // Dark Mode Switch
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, themeState) {
                      return SwitchListTile(
                        secondary: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            themeState.isDark
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_rounded,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        title: const Text('Dark Mode'),
                        subtitle: Text(
                          themeState.isDark
                              ? 'Switch to light appearance'
                              : 'Switch to dark appearance',
                        ),
                        value: themeState.isDark,
                        onChanged: (val) {
                          context.read<ThemeBloc>().add(const ToggleThemeEvent());
                        },
                      );
                    },
                  ),
                  const Divider(height: 1),
                  _buildProfileTile(
                    context,
                    icon: Icons.local_shipping_outlined,
                    title: 'Order History',
                    subtitle: 'Track recent orders and invoices',
                    onTap: () {
                      _showInfoSnackBar(context, 'Order history screen');
                    },
                  ),
                  const Divider(height: 1),
                  _buildProfileTile(
                    context,
                    icon: Icons.location_on_outlined,
                    title: 'Shipping Addresses',
                    subtitle: '2 saved delivery locations',
                    onTap: () {
                      _showInfoSnackBar(context, 'Manage delivery addresses');
                    },
                  ),
                  const Divider(height: 1),
                  _buildProfileTile(
                    context,
                    icon: Icons.credit_card_rounded,
                    title: 'Payment Methods',
                    subtitle: 'Visa ending in 4242',
                    onTap: () {
                      _showInfoSnackBar(context, 'Manage saved cards');
                    },
                  ),
                  const Divider(height: 1),
                  _buildProfileTile(
                    context,
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    subtitle: 'Offers, deals, and delivery updates',
                    onTap: () {
                      _showInfoSnackBar(context, 'Notification settings');
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Help & About
            Card(
              child: Column(
                children: [
                  _buildProfileTile(
                    context,
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Customer Support',
                    subtitle: '24/7 Live Chat and FAQs',
                    onTap: () {
                      _showInfoSnackBar(context, 'Support team contacted');
                    },
                  ),
                  const Divider(height: 1),
                  _buildProfileTile(
                    context,
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy & Terms',
                    subtitle: 'Terms of service and data policy',
                    onTap: () {
                      _showInfoSnackBar(context, 'Opening privacy policy');
                    },
                  ),
                  const Divider(height: 1),
                  _buildProfileTile(
                    context,
                    icon: Icons.logout_rounded,
                    title: 'Sign Out',
                    subtitle: 'Log out of your account',
                    iconColor: Colors.red,
                    textColor: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Sign Out'),
                          content: const Text(
                              'Are you sure you want to sign out of Nova Store?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                                _showInfoSnackBar(
                                    context, 'Signed out successfully');
                              },
                              child: const Text(
                                'Sign Out',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text(
              'Nova Store v1.0.0 (Clean Architecture with BLoC)',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    final theme = Theme.of(context);
    final primary = iconColor ?? theme.colorScheme.primary;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: primary),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded, size: 20),
      onTap: onTap,
    );
  }

  void _showInfoSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
