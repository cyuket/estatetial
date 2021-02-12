import 'package:estatetial/ui/views/details.dart';
import 'package:estatetial/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:estatetial/constant/route_names.dart';

import 'package:estatetial/ui/views/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashScreen(),
      );
    case HomeContainerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeViewScreen(),
      );
    case DetailPageRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DetailPageScreen(
          launchModel: settings.arguments,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
