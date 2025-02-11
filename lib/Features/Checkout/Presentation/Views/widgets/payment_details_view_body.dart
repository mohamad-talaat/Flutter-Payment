import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/custom_credit_card.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: PaymentMethods(
            onSelected: (int value) {},
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(),
        )
      ],
    );
  }
}
