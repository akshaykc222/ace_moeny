 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.dashboard,
      getPages: AppRoutes.routes,
    );
  }
}
