import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rider/screens/fetch_order/fetch_order_modal/fetch_order_modal.dart';
class OrderController {

  Future<Fetch_order> fetchOrderData() async {
    final String apiUrl = 'https://falcon.onelogitech.com/api/riderapp_loadsheet';
    final Map<String, String> headers = {
      'Ridername': 'zainKhan',
      'Riderpassword': 'demo@1234',
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=ff9b133ff5fc192915fc79a0450c4944'
    };
    final Map<String, dynamic> requestBody = {
      "master_no": "1"
    };
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        return Fetch_order.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load order data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch order data: $e');
    }
  }
  // @override
  // void onInit() {
  //   fetchData();
  //   super.onInit();
  // }
   List<Map<String, dynamic>> orders = [];
  
}
