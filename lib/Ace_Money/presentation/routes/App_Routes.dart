import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled7/Ace_Money/presentation/bindings/upiidcontrollerbinding.dart';
import 'package:untitled7/Ace_Money/presentation/pages/homepage.dart';
import 'package:untitled7/Ace_Money/presentation/pages/pay_upiid.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payupiid_page2.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payupiid_page3.dart';
import 'package:untitled7/Ace_Money/presentation/pages/qrScanPage.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';

class AppRoutes{
static List<GetPage> routes = [
  ///Shibin
  GetPage(name: AppPages.homepage, page: ()=> const HomePage()),











  ///Shinas
  GetPage(name: AppPages.qrScanPage, page: ()=>const QrScanPage()),
  ///
  


  ///vishnu
  GetPage(name: AppPages.payupiidpage, page: ()=> const PayUpiIdScreen(),binding: UpiIdControllerBindings()),
  GetPage(name: AppPages.payupiidpage2, page: ()=> const PayUpiIdScreen2()),
  GetPage(name: AppPages.payupiidpage3, page: ()=> const PayUpiIdScreen3()),
];
}