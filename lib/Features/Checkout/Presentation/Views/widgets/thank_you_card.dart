import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/credit_card_info_widget.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/thank_you_item_info.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/total_price_widget.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFFEDEDED),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            Text(
              'Thank your!',
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
            ),
            SizedBox(
              height: 42,
            ),
            ThankYouItemInfo(title: 'Date', value: '01/24/2023'),
            SizedBox(
              height: 20,
            ),
            ThankYouItemInfo(title: 'Time', value: '10:15 AM'),
            SizedBox(
              height: 20,
            ),
            ThankYouItemInfo(title: 'to', value: 'Sam Louis'),
            const Divider(
              thickness: 2,
              color: Color(0xffC7C7C7),
              height: 60,
            ),
            TotalPriceWidget(title: 'Total', value: r'$50.97'),
            SizedBox(height: 20),
            CreditCardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/barcode_icon.svg',
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        color: Color(0xff34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.style24.copyWith(
                        color: Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:
                  ((MediaQuery.sizeOf(context).height * 0.15 + 20) / 2) - 28,
            ),
          ],
        ),
      ),
    );
  }
}
