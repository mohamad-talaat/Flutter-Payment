import 'package:flutter/material.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/widgets/my_cart_view_body.dart';
import 'package:flutter_payment/core/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: 'My Cart'),
      body: MyCartViewBody(),
    );
  }
}
