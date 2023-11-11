class UserData {
  final String uid;
  final String name;
  final String phone;
  final List<Map<String, dynamic>> friends;
  final String img_url;

  UserData({
    required this.name,
    required this.phone,
    required this.uid,
    String? img_url,
    List<Map<String, dynamic>>? friends,
  })  : friends = friends ?? [],
        img_url = img_url ?? '';
}

class Friend {
  final String uid;
  final String name;
  final String phone;
  final String img_url;

  Friend({
    required this.uid,
    required this.name,
    required this.phone,
    String? img_url,
  }) : img_url = img_url ?? '';
}
