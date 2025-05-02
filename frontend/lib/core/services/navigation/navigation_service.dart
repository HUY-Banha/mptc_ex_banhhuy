import 'package:flutter/material.dart';

class NavigationService {

   NavigationService.internal();

   static final NavigationService _instance = NavigationService.internal();

   factory NavigationService() => _instance;

   static NavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // context
  BuildContext get context => navigatorKey.currentContext!;

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() {
    return navigatorKey.currentState!.pop();
  }


}
