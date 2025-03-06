import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class MyFatoorahService {
  final String apiKey;
  final bool isTest;

  MyFatoorahService({required this.apiKey, this.isTest = true});

  //! Base URL for MyFatoorah API
  String get baseUrl => isTest
      ? 'https://apitest-sa.myfatoorah.com'
      : 'https://api-sa.myfatoorah.com';

  //! Headers for API requests
  Map<String, String> get headers => {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      };

  //! Step 1: Initiate Payment
  Future<Map<String, dynamic>> initiatePayment(
      double invoiceAmount, String currencyIso) async {
    final url = Uri.parse('$baseUrl/v2/SendPayment');
    final body = jsonEncode({
      "InvoiceValue": 100,
      "CustomerName": "Ahmed Elgamal",
      "CustomerEmail": "kareemmhammed53@gmail.com",
      "CustomerMobile": "01026984562",
      "CallBackUrl": "https://yourwebsite.com/success",
      "ErrorUrl": "https://yourwebsite.com/error",
      "Language": "AR", // أو "EN"
      "DisplayCurrencyIso": currencyIso,
      "NotificationOption": "EML"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log('MyFatoorah API Error: ${response.body}');
      throw Exception('Failed to initiate payment: ${response.body}');
    }
  }

  //! Step 2: Execute Payment
  Future<Map<String, dynamic>> executePayment(
      String paymentMethodId, double invoiceValue) async {
    final url = Uri.parse('$baseUrl/v2/ExecutePayment');
    final body = jsonEncode({
      'PaymentMethodId': paymentMethodId,
      'InvoiceValue': invoiceValue,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to execute payment: ${response.body}');
    }
  }

  //! Step 3: Check Payment Status
  Future<Map<String, dynamic>> checkPaymentStatus(String paymentId) async {
    final url = Uri.parse('$baseUrl/v2/GetPaymentStatus');
    final body = jsonEncode({
      'Key': paymentId,
      'KeyType': 'PaymentId',
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to check payment status: ${response.body}');
    }
  }
}
