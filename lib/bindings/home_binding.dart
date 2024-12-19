import 'package:get/get.dart';
import 'package:time_to_go/services/google_map_service.dart';

import '../services/database_service.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DatabaseService>(() => DatabaseService());
    Get.lazyPut<GoogleMapService>(() => GoogleMapService());
  }
}
