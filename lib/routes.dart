import 'package:get/get.dart';
import 'package:touch_dice/pages/homepage.dart';
import 'package:touch_dice/pages/winnersScreen.dart';

class Routes {
  static var routes = [
    GetPage(name: "/First-Page", page: () => const HomePage()),
    GetPage(name: "/Winner-Page", page: () => const WinnersScreen()),
  ];
}
