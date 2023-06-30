import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled7/Ace_Money/presentation/manager/Bindings/DashBoard_Bindings.dart';
import 'package:untitled7/Ace_Money/presentation/pages/Create_VpaScreen.dart';
import 'package:untitled7/Ace_Money/presentation/pages/dashboard.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';

import '../pages/payContacts.dart';

class AppRoutes {
  static List<GetPage> routes = [
    ///Shibin
    GetPage(name: AppPages.dashboard, page: () => DashBoard(), binding: DashBoardBindings()),
    GetPage(name: AppPages.createVpaScreen, page: ()=> CreateVpaScreen()),
    ///Shinas
    ///
    ///

    ///jishnu
    GetPage(name: AppPages.paycontacts, page: () => PayContacts()),
  ];
}
