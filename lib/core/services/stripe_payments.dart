import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../utils/constants.dart';
import '../../feature/checkout/data/model/ephemeral_key_model/ephemeral_key_model.dart';
import '../../feature/checkout/data/model/payment_intent_input_model/init_payment_sheet_input_model.dart';
import '../../feature/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import '../../feature/checkout/data/model/payment_intent_model/payment_intent_model.dart';

class StripeService {
  // create paymentIntent
  Future<PaymentIntentModel> _createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    final response = await Dio().post(
      'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentInputModel.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $kToken',
          'Content-Type': Headers.formUrlEncodedContentType,
        },
      ),
    );
    final data = PaymentIntentModel.fromJson(response.data);
    return data;
  }

  Future<void> _initPaymentSheet(
      {required InitPaymentSheetInputModel paymentSheetParameters}) async {
    try {
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          merchantDisplayName: 'Ali Nassef',
          paymentIntentClientSecret:
              paymentSheetParameters.paymentIntentClientSecret,
          customerEphemeralKeySecret:
              paymentSheetParameters.customerEphemeralKeySecret,
          customerId: paymentSheetParameters.customerId,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    final response = await Dio().post(
      'https://api.stripe.com/v1/ephemeral_keys',
      data: {
        'customer': customerId,
      },
      options: Options(
        headers: {
          'Stripe-Version': '2024-10-28.acacia',
          'Authorization': 'Bearer $kToken',
          'Content-Type': Headers.formUrlEncodedContentType,
        },
      ),
    );
    final data = EphemeralKeyModel.fromJson(response.data);
    return data;
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    final paymentIntent = await _createPaymentIntent(
      paymentIntentInputModel,
    );
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    var paymentSheetParameters = InitPaymentSheetInputModel(
      customerEphemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
      paymentIntentClientSecret: paymentIntent.clientSecret!,
    );
    await _initPaymentSheet(
      paymentSheetParameters: paymentSheetParameters,
    );
    await _displayPaymentSheet();
  }
}
