import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/paypal_amount_model/details.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/paypal_amount_model/paypal_amount_model.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/paypal_item_list_model/item.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/paypal_item_list_model/paypal_item_list_model.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/manger/cubit/payment_cubit.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/manger/cubit/payment_state.dart';
import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final int activeIndex;
  const CustomButtonBlocConsumer({
    super.key,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is PaymentFailure) {
          // Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: 'Continue',
          onTab: () {
            if (activeIndex == 0) {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: '100',
                currency: 'USD',
                customerId: 'cus_RkoegGLFJTnbHc',
              );
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            } else if (activeIndex == 1) {
              var transactionData = getTransctionData();
              excutePaypalNavigator(context, transactionData);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  void excutePaypalNavigator(
      BuildContext context,
      ({
        PaypalAmountModel amount,
        PaypalItmeListModel itemList
      }) transactionData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ThankYouView(),
              ),
            );
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({PaypalAmountModel amount, PaypalItmeListModel itemList})
      getTransctionData() {
    var amount = PaypalAmountModel(
      total: '100',
      currency: 'USD',
      details: Details(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );
    List<Item> items = [
      Item(
        name: 'Apple',
        quantity: 4,
        price: '10',
        currency: 'USD',
      ),
      Item(
        name: 'Pineapple',
        quantity: 5,
        price: '12',
        currency: 'USD',
      ),
    ];
    var itemList = PaypalItmeListModel(items: items);

    return (amount: amount, itemList: itemList);
  }
}
