import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/section_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader('Account'),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _buildAccountTile(
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    subtitle: 'Update your name and email',
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildAccountTile(
                    icon: Icons.lock_outline,
                    title: 'Change Password',
                    subtitle: 'Update your security credentials',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SectionHeader('Preferences'),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _buildSwitchTile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Receive app notifications',
                    value: settingsProvider.notificationsEnabled,
                    onChanged: settingsProvider.setNotificationsEnabled,
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildSwitchTile(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    subtitle: 'Enable dark theme',
                    value: settingsProvider.darkModeEnabled,
                    onChanged: settingsProvider.setDarkModeEnabled,
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildSwitchTile(
                    icon: Icons.location_on_outlined,
                    title: 'Location',
                    subtitle: 'Allow location access',
                    value: settingsProvider.locationEnabled,
                    onChanged: settingsProvider.setLocationEnabled,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SectionHeader('Support'),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _buildSupportTile(
                    icon: Icons.help_outline,
                    title: 'Help Center',
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildSupportTile(
                    icon: Icons.info_outline,
                    title: 'About App',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Icon(icon),
        ),
        Expanded(
          child: SwitchListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSupportTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
