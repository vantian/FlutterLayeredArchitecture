import 'package:get/get.dart';
import 'package:layered_architecture/controllers/joke_ctrl.dart';
import 'package:layered_architecture/repositories/joke_repo.dart';
import 'package:layered_architecture/services/joke_services.dart';
import 'package:layered_architecture/views/joke_show.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/joke', //route name
      page: () => JokeShow(),
      binding: BindingsBuilder(() {
        // Register Dependency injection
        Get.lazyPut(() => JokeRepo());
        Get.lazyPut(() => JokeServices(Get.find()));
        Get.lazyPut(() => JokeController(Get.find()));
      }),
    ),
  ];
}
