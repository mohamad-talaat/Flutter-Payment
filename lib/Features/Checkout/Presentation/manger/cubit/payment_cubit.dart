import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment/Features/Checkout/Data/repos/checkout_repo.dart';
import 'package:flutter_payment/Features/Checkout/Presentation/manger/cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());

  final CheckoutRepo checkOutRepo;

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
        (left) => emit(
              PaymentFailure(
                errMessage: left.toString(),
              ),
            ),
        (right) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
