import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/AddBankAccountControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/Bindings/QrScanPageControllerBinding.dart';
import 'package:untitled7/Ace_Money/presentation/pages/addBankAccount.dart';
import 'package:untitled7/Ace_Money/presentation/pages/qrScanPage.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import '../pages/dashboard.dart';
import '../pages/payContacts.dart';
class AppRoutes {
  static List<GetPage> routes = [
    ///Shibin
    GetPage(name: AppPages.dashboard, page: () => DashBoard()),

    ///Shinas
    GetPage(name: AppPages.qrScanPage, page: ()=> QrScanPage(),bindings: [QrScanControllerBinding()]),
    GetPage(name: AppPages.addBankAccount, page: ()=> AddBankAccount(),bindings: [AddBankAccountControllerBinding()]),

    ///jishnu
    GetPage(name: AppPages.paycontacts, page: () => PayContacts()),
  ];
}
