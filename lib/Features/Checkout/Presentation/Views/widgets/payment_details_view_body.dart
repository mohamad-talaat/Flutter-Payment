import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/payment_method_item.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodItem(
          isActive: false,
        ),
      ],
    );
  }
}
