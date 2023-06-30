import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/domain/entities/BankListModal.dart';
import 'package:untitled7/Ace_Money/presentation/themes/App_Assets.dart';

class AddBankAccountController extends GetxController {
  // final BankListModal bankListModal;

  final List<BankListModal> bankIcons = [
    BankListModal(
      title: 'Axis Bank',
      customIconModal: AppAssets.axisBank,
    ),
    BankListModal(
      title: 'HDFC Bank',
      customIconModal: AppAssets.hdfcBank,
    ),
    BankListModal(
      title: 'ICICI Bank',
      customIconModal: AppAssets.iciciBank,
    ),
    BankListModal(
      title: 'State Bank of India',
      customIconModal: AppAssets.sbiBank,
    ),
    BankListModal(
      title: 'Punjab National Bank',
      customIconModal: AppAssets.pnbBank,
    ),
    BankListModal(
      title: 'Bank of Baroda',
      customIconModal: AppAssets.bobBank,
    ),
    BankListModal(
      title: 'Allahabad Bank',
      customIconModal: AppAssets.allahabadBank,
    ),
    BankListModal(
      title: 'Andhra Bank',
      customIconModal: AppAssets.andhraBank,
    ),
    BankListModal(
      title: 'Bank of America',
      customIconModal: AppAssets.boaBank,
    ),
    BankListModal(
      title: 'Bank of India',
      customIconModal: AppAssets.boiBank,
    ),
  ];

  List<String> banks = [
    'Axis Bank',
    'HDFC Bank',
    'ICICI Bank',
    'State Bank of India',
    'Punjab National Bank',
    'Bank of Baroda',
    'Allahabad Bank',
    'Andhra Bank',
    'Bank of America',
    'Bank of India'
  ];

  List<String> filteredBanks = [];

//  filteredBanks.addAll(banks);

  void filterBanks(String query) {
    if (query.isNotEmpty) {
      filteredBanks = banks
          .where((bank) => bank.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredBanks.addAll(banks);
    }
  }

  final ScrollController scrollController = ScrollController();
  String selectedLetter = '';

  final List<String> alphabet = [
    '#',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  // filteredBanks.addAll(banks);

  void scrollToLetter(String letter) {
    selectedLetter = letter;

    final index = filteredBanks.indexWhere(
        (bank) => bank.toLowerCase().startsWith(letter.toLowerCase()));
    if (index != -1) {
      const itemExtent = 0;
      final maxExtent = itemExtent * filteredBanks.length;
      final offset = index * itemExtent;
      final clampedOffset = offset.clamp(0, maxExtent);
      scrollController.animateTo(clampedOffset.toDouble(),
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  List<Widget> buildBankGrid() {
    return bankIcons.take(6).map((bank) {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  // Background color of the circle
                  radius: 20,
                  // Radius of the circle
                  child: IconButton(
                    onPressed: () {
                      //  bankListModal.ontap!();
                    },
                    icon: Image.asset(
                      bank.customIconModal,
                      height: 30,
                      width: 30,
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                bank.title,
                style: const TextStyle(
                  fontSize: 11.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  List<dynamic> bankLogos = [
    AppAssets.hdfcBank,
    AppAssets.iciciBank,
    AppAssets.sbiBank,
    AppAssets.pnbBank,
    AppAssets.bobBank,
    AppAssets.allahabadBank,
    AppAssets.andhraBank,
    AppAssets.boaBank,
    AppAssets.boiBank,
  ];

  @override
  void onInit() {
    filteredBanks.addAll(banks);
    filteredBanks.addAll(banks);
    super.onInit();
  }
}
