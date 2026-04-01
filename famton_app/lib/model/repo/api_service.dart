import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:famton_app/model/userdatamodel.dart';

class ApiService {
  final String apiUrl = "https://reqres.in/api/users?page=2";

  Future<FetchUserData> getDataFromApi() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Content-Type": "application/json",
      "x-api-key":
          "pro_a8b53c4e884cc458e6d6a14086652ba7ade4755977773e7e41a23ca6364c5002",
    });
    if (response.statusCode == 200) {
      print(response.body);
      return FetchUserData.fromJson(jsonDecode(response.body));
    } else {
      print("Failed to load data ${response.body}");
      throw Exception("Failed to load data ");
    }
  }
}
