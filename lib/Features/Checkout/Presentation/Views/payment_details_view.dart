import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/payment_details_view_body.dart';
import 'package:flutter_payment/core/widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}
