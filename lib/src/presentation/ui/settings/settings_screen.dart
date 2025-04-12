import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/presentation/bloc/system/system_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/config/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String name = 'settings';
  static const String path = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String appVersion = '';
  String buildNumber = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildSettingsList(context)),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: .5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.person, size: 35, color: Colors.white),
            // For actual user image, you would use:
            // backgroundImage: NetworkImage('user_avatar_url'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  'john.doe@example.com',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to profile edit screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildSettingsCategory('Account Settings'),
          _buildSettingsItem(
            icon: Icons.person_outline,
            title: 'Profile Information',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.vpn_key_outlined,
            title: 'Change Password',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {},
          ),

          const SizedBox(height: 16),
          _buildSettingsCategory('App Settings'),
          BlocBuilder<SystemCubit, SystemState>(
            bloc: sl<SystemCubit>(),
            builder: (context, state) {
              return _buildSettingsItem(
                icon: Icons.burst_mode_sharp,
                title: 'System Theme Mode',
                trailing: Switch(
                  value: state.themeMode == ThemeMode.system,
                  onChanged: (value) {
                    sl<SystemCubit>().setThemeMode(
                      value ? ThemeMode.system : ThemeMode.light,
                    );
                  },
                ),
                onTap: null,
              );
            },
          ),
          BlocBuilder<SystemCubit, SystemState>(
            bloc: sl<SystemCubit>(),
            builder: (context, state) {
              return _buildSettingsItem(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                trailing: Switch(
                  value: state.isDarkMode ?? false,
                  onChanged:
                      state.themeMode == ThemeMode.system
                          ? null
                          : (value) {
                            sl<SystemCubit>().setThemeMode(
                              value ? ThemeMode.dark : ThemeMode.light,
                            );
                            sl<SystemCubit>().setTheme(
                              value ? AppTheme.darkTheme : AppTheme.lightTheme,
                            );
                          },
                  activeColor:
                      state.themeMode == ThemeMode.system
                          ? Colors.grey.shade400
                          : Colors.blue,
                  inactiveThumbColor:
                      state.themeMode == ThemeMode.system
                          ? Colors.grey.shade300
                          : null,
                  inactiveTrackColor:
                      state.themeMode == ThemeMode.system
                          ? Colors.grey.shade200
                          : null,
                ),
                onTap: null,
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.language_outlined,
            title: 'Language',
            subtitle: 'English',
            onTap: () {},
          ),

          const SizedBox(height: 16),
          _buildSettingsCategory('Support'),
          _buildSettingsItem(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.contact_support_outlined,
            title: 'Contact Support',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.description_outlined,
            title: 'Terms of Service',
            onTap: () {},
          ),

          const SizedBox(height: 16),
          _buildSettingsItem(
            icon: Icons.logout,
            title: 'Logout',
            textColor: Colors.red,
            onTap: () {
              // Logout logic
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSettingsCategory(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing:
          trailing ?? (onTap != null ? const Icon(Icons.chevron_right) : null),
      onTap: onTap,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/logos/logo.png', width: 24, height: 24),
          ),
          const SizedBox(width: 8),
          Text(
            'Version $appVersion ($buildNumber)',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
