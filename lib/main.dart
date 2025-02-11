import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/my_cart_view.dart';
import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// Stripe

// Payment without save cards
// 1- paymentIntent(amount, currency)
// 2- initPaymentSheet(paymentIntentClientSecret)
// 3- presentPaymentSheet()

// payment with save cards

// 1- create customer({name , email,phone,............,customerId})
// 2- paymentIntent(amount, currency,customerId)
// 3- createEphemeralKey(customerId)
// 4- initpaymentSheet(merchantDisplayName , intentClientSecret,ephemeralKey)
// 5- presentPaymentSheet()
