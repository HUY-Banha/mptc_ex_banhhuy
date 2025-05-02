import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/widget/contact_button.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/widget/section_header.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/widget/skill_tag.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDetailScreen extends StatelessWidget {
  Profile profile;

  ProfileDetailScreen({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
        if (state is ProfileLoaded) {
          profile = state.profiles.lastWhere(
            (profile) => profile.id == this.profile.id,
            orElse: () => throw Exception('Profile not found'),
          );
        }
      }, builder: (context, state) {
        if (state is ProfileLoaded) {
          profile = state.profiles.lastWhere(
            (profile) => profile.id == this.profile.id,
            orElse: () => throw Exception('Profile not found'),
          );
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: _buildProfileHeader(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 24),
                  _buildAboutSection(),
                  const SizedBox(height: 24),
                  _buildSkillsSection(),
                  const SizedBox(height: 24),
                  _buildContactSection(context),
                  const SizedBox(height: 24),
                  _buildPortfolioSection(context),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show message dialog or navigate to message screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message feature coming soon!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        icon: const Icon(Icons.chat_bubble_outline),
        label: const Text('Message'),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    const Color(0xFF8A84FF),
                  ],
                ),
              ),
            ),
            // Pattern overlay
            Opacity(
              opacity: 0.1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.transparenttextures.com/patterns/cubes.png',
                    ),
                    repeat: ImageRepeat.repeat,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Center(
                child: Hero(
                  tag: 'profile-${profile.id}',
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _buildProfileImage(profile.photoUrl, context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF2D3748),
            size: 20,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit,
              color: Color(0xFF2D3748),
              size: 20,
            ),
          ),
          onPressed: () {
            context.push('/home/profile/upsert', extra: profile);
          },
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.share_outlined,
              color: Color(0xFF2D3748),
              size: 20,
            ),
          ),
          onPressed: () =>
              context.read<ProfileBloc>().add(ShareProfile(profile: profile)),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      // transform: Matrix4.translationValues(0, -60, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(
            profile.name ?? "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          // Role with custom container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              profile.role ?? "No role available",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Status indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Available for work',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'About',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          Text(
            profile.bio ?? "No bio available",
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF495057),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Skills',
            icon: Icons.code,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.skills!
                .map((skill) => SkillTag(skill: skill.name ?? ""))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Contact',
            icon: Icons.contact_mail_outlined,
          ),
          const SizedBox(height: 16),
          ContactButton(
            icon: Icons.email_outlined,
            label: profile.contractMethod?.email ?? "No email available",
            onTap: () async {
              // Open email client
              final email = "banhahuy.official@gmail.com";
              //profile.contractMethod?.email;
              if (email != null && email.isNotEmpty) {
                final uri = Uri(
                  scheme: 'mailto',
                  path: email,
                );
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  // handle error (e.g., show a snackbar)
                  print("Could not launch email client");
                }
              }
            },
          ),
          if (profile.contractMethod?.linkedIn != null)
            ContactButton(
              icon: Icons.link,
              label: 'LinkedIn',
              onTap: () {
                // Open LinkedIn profile
              },
            ),
          if (profile.contractMethod?.github != null)
            ContactButton(
              icon: Icons.code,
              label: 'GitHub',
              onTap: () {
                // Open GitHub profile
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection(BuildContext context) {
    // Mock portfolio projects
    final projects = [
      {'name': 'E-commerce App', 'type': 'Mobile App'},
      {'name': 'Company Website', 'type': 'Web Design'},
      {'name': 'Task Manager', 'type': 'Mobile App'},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Portfolio',
            icon: Icons.work_outline,
          ),
          const SizedBox(height: 16),
          ...projects.map((project) => _buildPortfolioItem(context, project)),
        ],
      ),
    );
  }

  Widget _buildPortfolioItem(
      BuildContext context, Map<String, String> project) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              project['type'] == 'Mobile App' ? Icons.smartphone : Icons.web,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  project['type']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(String? photoUrl, BuildContext context) {
    if (photoUrl == null || photoUrl.isEmpty) {
      return _buildPlaceholder();
    }

    final isNetwork = photoUrl.startsWith('http');

    if (isNetwork) {
      return Image.network(
        photoUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    } else {
      return Image.file(
        File(photoUrl),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: Icon(
        Icons.person,
        size: 40,
        color: Colors.grey[400],
      ),
    );
  }
}
