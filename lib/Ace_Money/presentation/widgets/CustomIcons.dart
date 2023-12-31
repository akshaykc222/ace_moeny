import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

import '../../domain/entities/IconModal.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({
    Key? key,
    required this.iconModal,
  }) : super(key: key);

  final CustomIconModal iconModal;

  @override
  Widget build(BuildContext context) {
    // Color randomColor = colors[2];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColors.offWhite1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              // backgroundColor: randomColor,
              // Background color of the circle
              radius: 20,
              // Radius of the circle
              child: IconButton(
                onPressed: () {
                  iconModal.ontap!();
                },
                icon: Icon(iconModal.customIconModal,
                    size: 25, color: AppColors.white),
              )),
          Text(
            iconModal.title,
            style: const TextStyle(
              fontSize: 11.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
