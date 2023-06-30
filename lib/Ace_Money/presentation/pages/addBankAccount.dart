// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled7/Ace_Money/presentation/manager/Controller/AddBankAccountController.dart';
//
// class AddBankAccount extends StatefulWidget {
//   @override
//   _AddBankAccountState createState() => _AddBankAccountState();
// }
//
// class _AddBankAccountState extends State<AddBankAccount> {
//
//   final controller = Get.put(AddBankAccountController());
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(''),
//       // ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               onChanged: controller.filterBanks,
//               decoration: const InputDecoration(
//                 hintText: 'Search Banks',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: controller.filteredBanks.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(controller.filteredBanks[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/widgets/CustomeBankList.dart';

import '../manager/Controller/AddBankAccountController.dart';
import '../themes/app_colors.dart';

class AddBankAccount extends StatefulWidget {
  @override
  _AddBankAccountState createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {

  final controller = Get.put(AddBankAccountController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue, // Customize the background color
        elevation: 0, // Remove the drop shadow
        title: const Text(
          'ADD BANK ACCOUNT',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: controller.filterBanks,
                decoration: const InputDecoration(
                  hintText: 'Search Banks',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: controller.buildBankGrid(),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.bankIcons.length,
                    itemBuilder: (context, index) {
                      //final bank = controller.filteredBanks[index];
                      return ListTile(
                        title: CustomBankList(bankListModal: controller.bankIcons[index]),
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var letter in controller.alphabet)
                              InkWell(
                                onTap: () => controller.scrollToLetter(letter),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    letter,
                                    style: TextStyle(
                                      fontWeight: controller.selectedLetter == letter
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
