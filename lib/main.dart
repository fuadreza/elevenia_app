import 'package:elevenia_app/core/constants/string_constants.dart';
import 'package:elevenia_app/core/theme/custom_theme.dart';
import 'package:elevenia_app/core/utils/connectivity_util.dart';
import 'package:elevenia_app/core/utils/navigation_util.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:elevenia_app/injection/injection.dart' as di;
import 'package:elevenia_app/core/route/main_route.dart' as router;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await connectivity.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      darkTheme: CustomTheme().dark,
      theme: CustomTheme().light,
      home: const HomePage(),
      navigatorKey: navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: router.routeHomePage,
    );
  }
}
