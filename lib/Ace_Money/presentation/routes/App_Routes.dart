import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/AddBankAccountControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/PayContactsControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/PayPhoneNoControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/QrScanPageControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/upiidcontrollerbinding.dart';
import 'package:untitled7/Ace_Money/presentation/pages/addBankAccount.dart';

import 'package:untitled7/Ace_Money/presentation/pages/payPhoneNo.dart';
import 'package:untitled7/Ace_Money/presentation/pages/pay_upiid.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payupiid_page2.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payupiid_page3.dart';
import 'package:untitled7/Ace_Money/presentation/pages/qrScanPage.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import '../pages/dashboard.dart';
import '../pages/payContacts.dart';

class AppRoutes {
  static List<GetPage> routes = [
    ///Shibin
    GetPage(name: AppPages.dashboard, page: () => DashBoard()),

    ///Shinas
    GetPage(
        name: AppPages.qrScanPage,
        page: () => QrScanPage(),
        bindings: [QrScanControllerBinding()]),
    GetPage(
        name: AppPages.addBankAccount,
        page: () => AddBankAccount(),
        bindings: [AddBankAccountControllerBinding()]),

    ///jishnu
    GetPage(
        name: AppPages.paycontacts,
        page: () => PayContacts(),
        binding: PayContactsControllerBinding()),
    GetPage(name: AppPages.payPhoneno, page: () => PayPhoneNo(), bindings: [
      PayContactsControllerBinding(),
      PayPhoneNoControllerBinding()
    ]),

    ///vishnu
    GetPage(
        name: AppPages.payupiidpage,
        page: () => const PayUpiIdScreen(),
        binding: UpiIdControllerBindings()),

    GetPage(name: AppPages.payupiidpage3, page: () => const PayUpiIdScreen3()),
  ];
}
