import 'package:dio/dio.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_payment/core/utils/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentInputModel.toJson(),
      token: ApiKeys.secreteKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var payementIntentModel = PaymentIntentModel.fromJson(response.data);
    return payementIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Amir Khairy',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
