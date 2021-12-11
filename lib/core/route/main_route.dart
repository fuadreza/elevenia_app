import 'package:elevenia_app/feature/elevenia/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String routeHomePage = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHomePage:
      return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
    default:
      return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
  }
}
