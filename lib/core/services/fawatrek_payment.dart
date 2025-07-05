import 'dart:developer';

import 'package:dio/dio.dart';
import '../../feature/checkout/data/model/fawatrek_model/fawatrek_model.dart';
import '../../feature/checkout/data/model/fawry_model/fawry_model.dart';
import '../../feature/checkout/data/model/masary_model/masary_model.dart';
import '../../feature/checkout/data/model/master_card_model/master_card_model.dart';

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

  Future<dynamic> sendPaymentRequest(
      {required FawaterkInputModel fawaterkInputModel}) async {
    final apiUrl = 'https://staging.fawaterk.com/api/v2/invoiceInitPay';
    final apiToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';

    final requestData = {
      "payment_method_id": fawaterkInputModel.paymentMethodId,
      "cartTotal": fawaterkInputModel.cartTotal,
      "currency": fawaterkInputModel.currency,
      "invoice_number": "123",
      "customer": {
        "first_name": "AliNassef",
        "last_name": "Ibrahem",
        "email": "alinassef1@fawaterk.com",
        "phone": "01142466363",
        "address": "test address"
      },
      "redirectionUrls": {
        "successUrl": "https://dev.fawaterk.com/success",
        "failUrl": "https://dev.fawaterk.com/fail",
        "pendingUrl": "https://dev.fawaterk.com/pending"
      },
      "cartItems": [
        {"name": "this is test oop 112252", "price": "25", "quantity": "4"},
        {"name": "this is test oop 112252", "price": "25", "quantity": "4"}
      ]
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

      if (fawaterkInputModel.paymentMethodId == 2 ||
          fawaterkInputModel.paymentMethodId == 30 ||
          fawaterkInputModel.paymentMethodId == 11 ||
          fawaterkInputModel.paymentMethodId == 6 ||
          fawaterkInputModel.paymentMethodId == 7) {
        return MasterCardModel.fromJson(response.data);
      } else if (fawaterkInputModel.paymentMethodId == 3) {
        return FawryModel.fromJson(response.data);
      } else if (fawaterkInputModel.paymentMethodId == 14) {
        return MasaryModel.fromJson(response.data);
      }
    } catch (error) {
      log(error.toString());
      throw Exception();
    }
  }
}
 // 6