import 'package:flutter_payment/Features/Checkout/Data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:flutter_payment/Features/Checkout/Data/models/init_payment_sheet_model/init_payment_sheet_model.dart';
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
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${ApiKeys.secreteKey}',
      },
    );
    var payementIntentModel = PaymentIntentModel.fromJson(response.data);
    return payementIntentModel;
  }

  Future initPaymentSheet({
    required InitPaymentSheetModel initPaymentSheetModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKeySecret,
        customerId: initPaymentSheetModel.customerId,
        merchantDisplayName: 'Amir Khairy',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      data: {
        'customer': customerId,
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${ApiKeys.secreteKey}',
        'Stripe-Version': '2025-01-27.acacia',
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    var intitPaymentSheetModel = InitPaymentSheetModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );

    await initPaymentSheet(
      initPaymentSheetModel: intitPaymentSheetModel,
    );

    await displayPaymentSheet();
  }
}
