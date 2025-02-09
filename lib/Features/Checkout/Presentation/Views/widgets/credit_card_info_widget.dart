import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_svg/svg.dart';

class CreditCardInfoWidget extends StatelessWidget {
  const CreditCardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 80,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 22,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/master_card_logo.svg',
            ),
            SizedBox(
              width: 23,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit Card',
                  style: Styles.style18,
                ),
                Text(
                  'Mastercard **78 ',
                  style: Styles.style18.copyWith(
                    color: Color(0xff000000).withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
