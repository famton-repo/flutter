class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class FetchUserData {
  final List<User> data;
  final int page;
  final int totalPages;

  FetchUserData({
    required this.data,
    required this.page,
    required this.totalPages,
  });

  factory FetchUserData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'];
    return FetchUserData(
      data: dataList.map((e) => User.fromJson(e)).toList(),
      page: json['page'],
      totalPages: json['total_pages'],
    );
  }
}
