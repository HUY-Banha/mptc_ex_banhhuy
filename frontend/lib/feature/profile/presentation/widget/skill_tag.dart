import 'package:flutter/material.dart';

class SkillTag extends StatelessWidget {
  final String skill;

  const SkillTag({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _getColorForSkill(skill, context).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getColorForSkill(skill, context).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: _getColorForSkill(skill, context),
        ),
      ),
    );
  }

  Color _getColorForSkill(String skill, BuildContext context) {
    // Return different colors based on skill category
    if (skill.toLowerCase().contains('flutter') ||
        skill.toLowerCase().contains('dart') ||
        skill.toLowerCase().contains('mobile')) {
      return const Color(0xFF5BC0DE); // Blue
    } else if (skill.toLowerCase().contains('design') ||
        skill.toLowerCase().contains('ui') ||
        skill.toLowerCase().contains('ux')) {
      return const Color(0xFFF0AD4E); // Orange
    } else if (skill.toLowerCase().contains('backend') ||
        skill.toLowerCase().contains('server') ||
        skill.toLowerCase().contains('database')) {
      return const Color(0xFF5CB85C); // Green
    } else if (skill.toLowerCase().contains('react') ||
        skill.toLowerCase().contains('javascript') ||
        skill.toLowerCase().contains('web')) {
      return const Color(0xFFD9534F); // Red
    } else {
      return Theme.of(context).primaryColor; // Default
    }
  }
}
