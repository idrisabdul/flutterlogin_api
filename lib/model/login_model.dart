import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data_model.dart';

class APIService {
  String errormessage, token;
  int errorcode;
  Data data;

  APIService({
    required this.errorcode,
    required this.errormessage,
    required this.token,
    required this.data,
  });

  @override
  String toString() {
    return 'Sample{error: $errorcode, errormessage: $errormessage, token: $token, data: $data}';
  }

  factory APIService.user(Map<String, dynamic> object) {
    return APIService(
      errorcode: object["errorcode"],
      errormessage: object["errormessage"],
      token: object["token"],
      data: Data.fromJson(object["data"]),
    );
  }

  static Future<APIService> connectAPI(
      String appId, String username, String pass) async {
    Uri url = Uri.parse("https://depooptik.com/apilogin");

    var hasilResponse = await http.post(
      url,
      body: {'appId': appId, 'username': username, 'password': pass},
    );

    var data = json.decode(hasilResponse.body);

    if (hasilResponse.statusCode == 200 || hasilResponse.statusCode == 400) {
      var user = (data as Map<String, dynamic>)['data'];
      return APIService.user(json.decode(hasilResponse.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
