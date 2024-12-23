import 'package:get/get.dart';

import '../pages/home_page.dart';

class Routes {
  static const String home = '/home';

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
  ];
}
