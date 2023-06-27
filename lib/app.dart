import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Ace_Money/presentation/routes/App_Pages.dart';
import 'Ace_Money/presentation/routes/App_Routes.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.qrScanPage,
      getPages: AppRoutes.routes,
    );
  }
}
