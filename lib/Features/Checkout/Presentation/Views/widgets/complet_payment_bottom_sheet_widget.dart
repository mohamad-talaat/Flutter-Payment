import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/custom_button_bloc_consumer.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/payment_methods_list_view.dart';

class CompletePaymentBottomSheet extends StatefulWidget {
  const CompletePaymentBottomSheet({super.key});

  @override
  State<CompletePaymentBottomSheet> createState() =>
      _CompletePaymentBottomSheetState();
}

class _CompletePaymentBottomSheetState
    extends State<CompletePaymentBottomSheet> {
  int activeIndex = 0;

  void updateActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

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
          PaymentMethods(
            onSelected: updateActiveIndex,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(
            activeIndex: activeIndex,
          ),
        ],
      ),
    );
  }
}
