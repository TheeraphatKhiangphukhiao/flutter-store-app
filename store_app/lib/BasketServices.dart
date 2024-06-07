import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/basket.dart';
import 'models/baskets.dart';

class Services {

  // เราจะทำการดึงข้อมูลจาก API มาเก็บไว้ใน model ที่เราสร้างไว้
  static const String url = "https://fakestoreapi.com/carts/user/1"; // static คือค่าคงที่

  static Future<Baskets> getBaskets() async { // async หมายความว่ามันจะรอจนกว่าจะเสร็จ, จนกว่าข้อมูลจะถูกส่งมาหมด
    try {
      final response = await http.get(Uri.parse(url)); // ทำการเรียก API, async and await จะใช้คู่กันคือรอจนกว่าจะเรียก API เสร็จเเละได้ข้อมูลตอบกลับมา
      if (200 == response.statusCode) { // 200 หมายถึงการดึงสำเร็จ
        return parseBaskets(response.body);
      } else {
        return Baskets();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Baskets(); // ถ้ามันไม่มีข้อมูลก็ให้ return ค่าเปล่าๆออกไป
    }
  }

  // method เพื่อเเปลง json ไปเป็น model ที่เราสร้างไว้
  static Baskets parseBaskets(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>(); // ทำการ decode ตัว reponseBody จาก response ที่เก็บข้อมูลที่ได้จาก API
    List<Basket> baskets = parsed.map<Basket>((json) => Basket.fromJson(json)).toList();
    Baskets b = Baskets();
    b.baskets = baskets;
    return b;
  }
}