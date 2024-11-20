import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:payments_getway/feature/checkout/data/model/fawatrek_model/fawatrek_model.dart';
import 'package:payments_getway/feature/checkout/data/model/master_card_model/master_card_model.dart';

import '../../feature/checkout/data/model/fawaterk_input_model/fawaterk_input_model.dart';

class FwatrekPayment {
  final Dio _dio = Dio();
  Future<FawatrekModel> fetchPaymentMethods() async {
    final apiUrl = 'https://staging.fawaterk.com/api/v2/getPaymentmethods';
    final accessToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: headers,
        ),
      );
      final data = FawatrekModel.fromJson(response.data);
      log(data.data![0].nameAr.toString());
      return data;
    } catch (error) {
      log(error.toString());
      throw Exception();
    }
  }

  Future<MasterCardModel> sendPaymentRequest(
      {required FawaterkInputModel fawaterkInputModel}) async {
    final apiUrl = 'https://staging.fawaterk.com/api/v2/invoiceInitPay';
    final apiToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';

    final requestData = {
      'payment_method_id': fawaterkInputModel.paymentMethodId,
      'cartTotal': fawaterkInputModel.cartTotal,
      'currency': fawaterkInputModel.currency,
      'customer': {
        'first_name': 'test',
        'last_name': 'test',
        'email': 'test@test.test',
        'phone': '01000000000',
        'address': 'test address',
      },
      'redirectionUrls': {
        'successUrl': 'https://dev.fawaterk.com/success',
        'failUrl': 'https://dev.fawaterk.com/fail',
        'pendingUrl': 'https://dev.fawaterk.com/pending',
      },
      'cartItems': [
        {
          'name': 'test',
          'price': '200',
          'quantity': '1',
        },
      ],
    };

    final headers = {
      'Authorization': 'Bearer $apiToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.post(
        apiUrl,
        options: Options(
          headers: headers,
        ),
        data: requestData,
      );
      log(response.data.toString());

      return MasterCardModel.fromJson(response.data);
    } catch (error) {
      log(error.toString());
      throw Exception();
    }
  }
}
