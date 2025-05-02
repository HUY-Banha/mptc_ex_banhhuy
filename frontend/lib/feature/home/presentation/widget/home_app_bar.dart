
import 'package:flutter/material.dart';
import 'package:mptc_exercise_banhahuy/feature/home/presentation/widget/language_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("MPTC Exercise Mobile App"),
      actions: const [
        LanguageButton(),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
