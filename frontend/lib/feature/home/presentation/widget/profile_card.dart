import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final VoidCallback onTap;

  const ProfileCard({
    Key? key,
    required this.profile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Hero(
                  tag: 'profile-${profile.id}',
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _buildProfileImage(profile.photoUrl, context),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              profile.role ?? "",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (profile.contractMethod?.github != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.code,
                                size: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          if (profile.contractMethod?.linkedIn != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.link,
                                size: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Builder(
                        builder: (context) {
                          if (profile.skills == null || profile.skills!.isEmpty) {
                            return const Text(
                              "No skills available",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF868E96),
                              ),
                            );
                          }
                          return Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: profile.skills!.take(3).map((skill) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F3F5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  skill.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF495057),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
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
