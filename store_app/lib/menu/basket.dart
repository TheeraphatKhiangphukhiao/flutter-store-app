import 'package:flutter/material.dart';
import '../BasketServices.dart';
import '../models/baskets.dart';

// สร้าง class ที่เป็น StatefulWidget , Stateful หมายถึง Widget ที่มี state หรือมีสภาวะการเปลี่ยนเเปลง ไปตามข้อมูลที่ได้รับ
// หรือจากการกำหนดจากผู้ใช้ เช่น เมื่อเรากดปุ่ม ok เเล้วเเสดงข้อความ นาย ก ได้เข้าระบบ
// โดยตั้งชื่อ class ให้สอดคล้องกับชื่อไฟล์
class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late Baskets baskets;
  late String title;

  @override
  void initState() {
    super.initState();
    title = 'Loading products...';
    baskets = Baskets();

    Services.getBaskets().then((usersFromServer) {
      setState(() {
        baskets = usersFromServer;

      });
    });
  }
  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: baskets.baskets == null ? 0 : baskets.baskets.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index){
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Product ID ${baskets!.baskets[index].id}",
                    style: TextStyle(
                      color: Colors.blue, // สีข้อความ
                      fontSize: 20, // ขนาดตัวอักษร
                      fontWeight: FontWeight.bold, // ตัวหนา
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.blue,
                    size: 24, // ขนาดของ Icon
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "Date order: ${baskets!.baskets[index].date}",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // สร้าง AppBar ที่มีชื่อตรงกับเมนู เช่นไฟล์นี้ชื่อ Basket
        title: const Text('ตะกร้าสินค้า'),
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