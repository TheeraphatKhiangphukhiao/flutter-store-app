import 'package:flutter/material.dart';
import '../Services.dart';
import '../models/products.dart';
import 'dart:async';

// สร้าง class ที่เป็น StatefulWidget , Stateful หมายถึง Widget ที่มี state หรือมีสภาวะการเปลี่ยนเเปลง ไปตามข้อมูลที่ได้รับ
// หรือจากการกำหนดจากผู้ใช้ เช่น เมื่อเรากดปุ่ม ok เเล้วเเสดงข้อความ นาย ก ได้เข้าระบบ
// โดยตั้งชื่อ class ให้สอดคล้องกับชื่อไฟล์
class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Products products;
  late String title;

  @override
  void initState() {
    super.initState();
    title = 'Loading products...';
    products = Products();

    Services.getProducts().then((usersFromServer) {
      setState(() {
        products = usersFromServer;

      });
    });
  }
  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: products.products == null ? 0 : products.products.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      elevation: 5, // เพิ่มเงาให้กับ Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // ปรับขอบ Card ให้มนเรียบ
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // ปรับขอบ Container ให้มนเรียบ
          color: Colors.white, // สีพื้นหลัง
          border: Border.all(
            color: Colors.blue, // เพิ่มสีขอบ
            width: 2.0, // กำหนดความหนาขอบ
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // ปรับขอบรูปภาพให้มนเรียบ
                child: Image.network(
                  products!.products[index].image,
                  width: 175,
                  height: 175,
                  fit: BoxFit.cover, // ปรับขนาดรูปภาพให้เต็มกล่อง
                ),
              ),
            ),
            SizedBox(height: 10), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
            Text(
              "${products!.products[index].title}",
              style: TextStyle(
                color: Colors.blue, // สีข้อความ
                fontSize: 20, // ขนาดตัวอักษร
                fontWeight: FontWeight.bold, // ตัวหนา
              ),
            ),
            SizedBox(height: 5), // เพิ่มระยะห่างระหว่างข้อความ
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow, // สีของดาว
                ),
                Text(
                  "Rate: ${products!.products[index].rating.rate}",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('สินค้าทั้งหมด'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10.0,
              ),
              list(),
            ],
          ),
        )
    );
  }

}