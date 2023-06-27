import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled7/Ace_Money/presentation/pages/homepage.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';

import '../pages/payContacts.dart';

class AppRoutes {
  static List<GetPage> routes = [
    ///Shibin
    GetPage(name: AppPages.homepage, page: () => HomePage()),

    ///Shinas
    ///
    ///

    ///jishnu
    GetPage(name: AppPages.paycontacts, page: () => PayContacts()),
  ];
}
