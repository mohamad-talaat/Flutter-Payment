import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/custom_button_bloc_consumer.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/payment_methods_list_view.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';

class CompletePaymentBottomSheet extends StatelessWidget {
  const CompletePaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethods(),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
