import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../bindings/home_binding.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Time To Go',
      initialBinding: HomeBinding(),
      initialRoute: Routes.home,
      getPages: Routes.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
