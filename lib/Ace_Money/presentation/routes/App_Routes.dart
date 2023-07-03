import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/PayContactsControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/PayPhoneNoControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/pages/homepage.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payPhoneNo.dart';
import 'package:untitled7/Ace_Money/presentation/pages/paymentUsingContacts.dart';
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
    GetPage(
        name: AppPages.paycontacts,
        page: () => PayContacts(),
        binding: PayContactsControllerBinding()),
    GetPage(name: AppPages.payPhoneno, page: () => PayPhoneNo(), bindings: [
      PayContactsControllerBinding(),
      PayPhoneNoControllerBinding()
    ]),
  ];
}
