import 'package:get/get.dart';
import 'package:touch_dice/pages/homepage.dart';

class Routes {
  static var routes = [
    GetPage(name: "/First-Page", page: () => const HomePage()),
  ];
}
