
import 'dart:convert';
import 'package:get/get.dart';
import 'package:rider/screens/reattempt/model/model.dart';
import 'package:http/http.dart' as http;

class ReattemptController extends GetxController {
  var bodyList = <Body>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData(); 
  }

  Future<void> fetchData() async {
    var headers = {
      'Ridername': 'zainKhan',
      'Riderpassword': 'demo@1234',
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=fc5f9fd74d1006552eb94b08ea7dc0c1'
    };
    var body = {
      // "start_date": "2023-06-01",
      // "end_date": "2023-10-13",
      // "rider_code": "2719"
    };

    final response = await http.post(
      Uri.parse('https://falcon.onelogitech.com/api/riderapp_reattemptFecth'),
      headers: headers,
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      final reattemptModel = ReattemptModel.fromJson(jsonDecode(response.body));
      bodyList.assignAll(reattemptModel.data?.body ?? []);
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
}
