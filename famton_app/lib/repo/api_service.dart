import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:famton_app/model/userdatamodel.dart';

class ApiService {
  final String baseUrl = "https://reqres.in/api";

  Future<FetchUserData> getUserData({int page = 1}) async {
    final String apiUrl = "$baseUrl/users?page=$page";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return FetchUserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user data: ${response.statusCode}");
    }
  }

  Future<FetchUserData> SVTUserData({int page = 2}) async {
    final String apiUrl = "$baseUrl/users?page=$page";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return FetchUserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load SVT user data: ${response.statusCode}");
    }
  }
}
