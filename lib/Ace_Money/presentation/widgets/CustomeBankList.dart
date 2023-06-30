

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/domain/entities/BankListModal.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

import '../manager/Controller/AddBankAccountController.dart';

class CustomBankList extends StatelessWidget {
  CustomBankList({
    Key? key,
    required, required this.bankListModal ,
  }) : super(key: key);

  final BankListModal bankListModal;
  final controller = Get.put(AddBankAccountController());


  @override
  Widget build(BuildContext context) {
    // Color randomColor = colors[2];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.offWhite1),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
          backgroundColor: Colors.white,
            // Background color of the circle
              radius: 20,
              // Radius of the circle
              child: IconButton(
                onPressed: () {
                  bankListModal.ontap!();
                },
                icon: Image.asset(bankListModal.customIconModal,height: 30,width: 30,),
              )),
          const SizedBox(width: 10,),
          Text(
            bankListModal.title,
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
