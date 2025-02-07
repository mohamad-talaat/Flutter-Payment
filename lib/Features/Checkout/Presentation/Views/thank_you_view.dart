import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/thank_you_view_body.dart';
import 'package:flutter_payment/core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: ''),
      body: ThankYouViewBody(),
    );
  }
}
