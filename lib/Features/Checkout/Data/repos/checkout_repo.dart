import 'package:dartz/dartz.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment/core/errors/failures.dart';

abstract class CheckoutRepo {
  Future<Either<Failure,void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}


