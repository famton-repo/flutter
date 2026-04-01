import 'dart:convert';

import 'package:famton_app/model/repo/api_service.dart';
import 'package:famton_app/model/userdatamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SVTUserData extends StatefulWidget {
  const SVTUserData({super.key});

  @override
  State<SVTUserData> createState() => _SVTUserDataState();
}

class _SVTUserDataState extends State<SVTUserData> {
  late Future<FetchUserData> UserData;
  final ApiService fetchData = ApiService();
  @override
  void initState() {
    super.initState();
    UserData = fetchData.getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch User Data '),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: FutureBuilder(
            future: UserData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final user = snapshot.data!.data[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text(user.firstName),
                        subtitle: Text(user.lastName),
                        trailing: Icon(Icons.arrow_forward),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: snapshot.data!.data.length);
              }
            } // Fallback return if none of the above conditions are met

            ),
      ),
    );
  }

  Future<FetchUserData> svtUserData() async {
    String url = "https://reqres.in/api/users?page=2";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return FetchUserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
