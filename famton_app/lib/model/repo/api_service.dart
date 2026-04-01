import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:famton_app/model/userdatamodel.dart';

class ApiService {
  final String apiUrl = "https://reqres.in/api/users?page=2";

  Future<FetchUserData> getDataFromApi() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return FetchUserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
