import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CreditCardWidget(
        //   cardNumber: cardNumber,
        //   expiryDate: expiryDate,
        //   cardHolderName: cardHolderName,
        //   cvvCode: cvvCode,
        //   showBackView: showBackView,
        //   isHolderNameVisible: true,
        //   onCreditCardWidgetChange: (value) {},
        // ),
        // CreditCardForm(
        //   cardNumber: cardNumber,
        //   expiryDate: expiryDate,
        //   cardHolderName: cardHolderName,
        //   cvvCode: cvvCode,
        //   onCreditCardModelChange: (creditCardModel) {
        //     cardHolderName = creditCardModel.cardHolderName;
        //     cardNumber = creditCardModel.cardNumber;
        //     expiryDate = creditCardModel.expiryDate;
        //     cvvCode = creditCardModel.cvvCode;
        //     showBackView = creditCardModel.isCvvFocused;
        //     setState(() {});
        //   },
        //   formKey: formKey,
        //   autovalidateMode: autovalidateMode,
        // ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: CustomButton(
            title: 'Pay',
            onTab: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                log('$cardNumber, $expiryDate, $cardHolderName, $cvvCode');

                setState(() {});
              } else {
                autovalidateMode = AutovalidateMode.always;

                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
