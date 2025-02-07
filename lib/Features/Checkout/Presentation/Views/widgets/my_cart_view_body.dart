import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/cart_info_item.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/complet_payment_bottom_sheet_widget.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/total_price_widget.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/basket.png',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CartInfoItemWidget(
            title: 'Product',
            value: '\$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const CartInfoItemWidget(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const CartInfoItemWidget(
            title: 'Shipping',
            value: '\$8',
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 34,
            endIndent: 10,
            indent: 10,
          ),
          const TotalPriceWidget(title: 'Total', value: '\$50.97'),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Complete Payment',
            onTab: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                context: context,
                builder: (context) {
                  return CompletePaymentBottomSheet();
                },
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
