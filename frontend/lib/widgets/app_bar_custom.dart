import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mptc_exercise_banhahuy/core/constants/app_colors.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    this.onPressedBack,
    this.actions,
    this.leading = true,
    this.backgroundColor = AppColors.primaryColor,
  });

  final String title;
  final Function()? onPressedBack;
  final List<Widget>? actions;
  final bool leading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: 8),
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: leading
            ? Container(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back, color: AppColors.whiteColor,
                  ),
                  onPressed: onPressedBack ??
                      () {
                        if (context.canPop()) {
                          context.pop();
                        }
                      },
                ),
              )
            : null,
        leadingWidth: leading ? 80 : 0,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600, color: AppColors.whiteColor),
        ),
        centerTitle: false,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}


class NoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.scaffoldBackground,
      surfaceTintColor: AppColors.scaffoldBackground,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0);
}
