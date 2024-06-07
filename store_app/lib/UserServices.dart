import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';

class Services {

  // เราจะทำการดึงข้อมูลจาก API มาเก็บไว้ใน model ที่เราสร้างไว้
  static const String url = "https://fakestoreapi.com/users/1"; // static คือค่าคงที่

  static Future<User> getUser() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUser(response.body); // ใส่ await เพื่อรอการ decode JSON เสร็จสิ้น
      } else {
        return User();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return User();
    }
  }

  // method เพื่อเเปลง json ไปเป็น model ที่เราสร้างไว้
  static User parseUser(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);
    User user = User.fromJson(parsed);
    return user;
  }
}