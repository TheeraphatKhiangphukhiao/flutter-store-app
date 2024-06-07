import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product.dart';
import 'models/products.dart';

class Services {

  // เราจะทำการดึงข้อมูลจาก API มาเก็บไว้ใน model ที่เราสร้างไว้
  static const String url = "https://fakestoreapi.com/products"; // static คือค่าคงที่

  static Future<Products> getProducts() async { // async หมายความว่ามันจะรอจนกว่าจะเสร็จ, จนกว่าข้อมูลจะถูกส่งมาหมด
    try {
      final response = await http.get(Uri.parse(url)); // ทำการเรียก API, async and await จะใช้คู่กันคือรอจนกว่าจะเรียก API เสร็จเเละได้ข้อมูลตอบกลับมา
      if (200 == response.statusCode) { // 200 หมายถึงการดึงสำเร็จ
        return parseProducts(response.body);
      } else {
        return Products();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Products(); // ถ้ามันไม่มีข้อมูลก็ให้ return ค่าเปล่าๆออกไป
    }
  }

  // method เพื่อเเปลง json ไปเป็น model ที่เราสร้างไว้
  static Products parseProducts(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>(); // ทำการ decode ตัว reponseBody จาก response ที่เก็บข้อมูลที่ได้จาก API
    List<Product> products = parsed.map<Product>((json) => Product.fromJson(json)).toList();
    Products p = Products();
    p.products = products;
    return p;
  }
}