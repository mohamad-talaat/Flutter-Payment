import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/manger/cubit/payment_cubit.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/manger/cubit/payment_state.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: 'Continue',
          onTab: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
            );
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
