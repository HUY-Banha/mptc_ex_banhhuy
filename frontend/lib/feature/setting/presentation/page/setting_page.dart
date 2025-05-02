import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mptc_exercise_banhahuy/core/blocs/language_cubit.dart';
import 'package:mptc_exercise_banhahuy/feature/setting/presentation/widget/settings_section_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Language Settings
              SettingsSectionCard(
                title: 'Language',
                icon: Icons.language,
                child: _buildLanguageSelector(context),
              ),
              const SizedBox(height: 16),
              
              // Appearance Settings
              SettingsSectionCard(
                title: 'Appearance',
                icon: Icons.palette_outlined,
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Mode',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {
                          // Toggle dark mode
                        },
                        activeColor: const Color(0xFF6C63FF),
                      ),
                    ),
                    const Divider(),
                    _buildSettingsItem(
                      icon: Icons.text_fields,
                      title: 'Text Size',
                      subtitle: 'Medium',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Navigate to text size settings
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Notification Settings
              SettingsSectionCard(
                title: 'Notifications',
                icon: Icons.notifications_outlined,
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.notifications_active_outlined,
                      title: 'Push Notifications',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {
                          // Toggle notifications
                        },
                        activeColor: const Color(0xFF6C63FF),
                      ),
                    ),
                    const Divider(),
                    _buildSettingsItem(
                      icon: Icons.email_outlined,
                      title: 'Email Notifications',
                      subtitle: 'Receive email updates',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {
                          // Toggle email notifications
                        },
                        activeColor: const Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Privacy & Security
              SettingsSectionCard(
                title: 'Privacy & Security',
                icon: Icons.security_outlined,
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Settings',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Navigate to privacy settings
                      },
                    ),
                    const Divider(),
                    _buildSettingsItem(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Navigate to change password
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // About & Help
              SettingsSectionCard(
                title: 'About & Help',
                icon: Icons.help_outline,
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.info_outline,
                      title: 'About App',
                      subtitle: 'Version 1.0.0',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Show about dialog
                      },
                    ),
                    const Divider(),
                    _buildSettingsItem(
                      icon: Icons.support_agent_outlined,
                      title: 'Help & Support',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Navigate to help & support
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Logout Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle logout
                  },
                  icon: const Icon(Icons.logout, color: Colors.white,),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63F0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, currentLocale) {
        final isEnglish = currentLocale.languageCode == 'en';
        
        return Column(
          children: [
            _buildLanguageOption(
              context: context,
              title: 'English',
              subtitle: 'English (US)',
              flagEmoji: '🇺🇸',
              isSelected: isEnglish,
              onTap: () {
                context.read<LanguageCubit>().changeLanguage(const Locale('en', 'US'));
              },
            ),
            const Divider(),
            _buildLanguageOption(
              context: context,
              title: 'ខ្មែរ',
              subtitle: 'Khmer',
              flagEmoji: '🇰🇭',
              isSelected: !isEnglish,
              onTap: () {
                context.read<LanguageCubit>().changeLanguage(const Locale('km', 'KH'));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String flagEmoji,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F5),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                flagEmoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFF6C63FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF6C63FF),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
