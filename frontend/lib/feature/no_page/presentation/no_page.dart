import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mptc_exercise_banhahuy/core/l10n/l10n.dart';
import 'package:mptc_exercise_banhahuy/widgets/app_bar_custom.dart';
class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: AppLocalizations.of(context).page_not_found,
        leading: true,
        
        onPressedBack: () {
          context.go('/home');
        },
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              '404',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'The page you are looking for does not exist.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
