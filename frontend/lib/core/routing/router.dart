import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mptc_exercise_banhahuy/core/services/navigation/navigation_service.dart';
import 'package:mptc_exercise_banhahuy/feature/camera_annotation/presentation/page/camera_annotation_page.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/home/presentation/page/home_page.dart';
import 'package:mptc_exercise_banhahuy/feature/no_page/presentation/no_page.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/page/profile_page.dart';
import 'package:mptc_exercise_banhahuy/feature/setting/presentation/page/setting_page.dart';
import 'package:mptc_exercise_banhahuy/feature/upsert_profile/presentation/upsert_profile_page.dart';

class AppRouter {
  AppRouter._();

  //onGenerateRoute

  static GoRouter router = GoRouter(
    navigatorKey: NavigationService.instance.navigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    // refreshListenable: GoRouterRefreshStream(authBloc.stream),
    // errorBuilder: (context, state) => NoPageFound(),
    errorPageBuilder: (context, state) => FadePage(child: NoPageFound()),
    routes: [
      GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) =>
                  ProfileDetailScreen(profile: state.extra as Profile),
            ),

            // GoRoute(
            //   path: '/settings',
            //   builder: (context, state) => const SettingsPage(),
            // ),

            GoRoute(
                path: '/profile/upsert',
                builder: (context, state) => UpsertProfilePage(
                      profile: state.extra as Profile?,
                    )),
                    GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
          ]),
      GoRoute(
        path: '/camera_screen',
        builder: (context, state) => const CameraAnnotationPage(),
      ),
      
    ],
  );
}

class FadePage extends CustomTransitionPage {
  FadePage({required super.child, super.key})
      : super(transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(opacity: animation, child: child);
        });
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
