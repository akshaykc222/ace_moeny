import 'package:flutter/material.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  // Widget? title;
  // bool? centerTitle;
  // double? elevation;
  // Color? backgroundColor;

  AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor, // Customize the background color
      elevation: 0, // Remove the drop shadow
       title: const Text(
         'QR CODE SCANNER',
         style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           letterSpacing: 1.5,
         ),
       ),
      centerTitle: true,
    );
  }
}