import 'package:flutter/material.dart';
import 'menu/product.dart';
import 'menu/basket.dart';
import 'menu/account.dart';

void main() {
  runApp(const MyApp()); // ทำการรัน MyApp() class
}

class MyApp extends StatelessWidget { // สร้าง class ที่เป็น StatelessWidget, Stateless หมายถึง Widget ไม่มีสภาวะเปลี่ยนเเปลง เช่น หน้าเเอปพลิเเคชันที่มีเเค่การเเสดงรูปเฉยๆ
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // ใน MyApp() class สร้าง MaterialApp ที่ชี้หน้า home ไปที่ MyHomePage() class เมื่อเปิดเเอป
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// MyHomePage() class จะมีการสร้าง scaffold เเละกำหนด bottomNavigationBar กับ body เเต่ไม่ได้กำหนด AppBar
// โดยขั้นตอนเมื่อเปิด App มา จะมาที่หน้า MyHomePage ก่อนโดยหน้า MyHomePage จะเป็นหน้าที่เเสดง NavigationBar เเละ เเสดงหน้า MyHomePage
// ที่มี icon Home เป็นหน้าเเรกหรือเป็นเมนูเเรกที่ Active เเละเมื่อเราเปลี่ยนเมนู ก็จะไปดึงหน้าต่างๆ ตามที่กำหนดใน Array data
// ที่สัมพันธ์กับเมนูมาเเสดง
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { // ใน class นี้จะเริ่มสร้าง bottomNavigationBar
  int _currentIndex = 0; // เพื่อชี้ index ไปที่ตำเเหน่งเเรกสุดของ Array

  final tabs = [ // ตัวเเปร tabs เป็น Array โดยข้อมูลในเเต่ละ Index จะเป็นชื่อ class ของทั้ง 5 ไฟล์เมนูที่สร้างไว้

    const ProductPage(),
    const BasketPage(),
    const AccountPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex], // เพื่อให้สามารถเเสดงผลได้ ให้เรียก tabs มาไว้ที่ body
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // ตัวเเปร _currentIndex จะเปลี่ยนเเปลงตามการกด Icon ใน BottomNavigation Bar เเละเเสดงผลที่ body
        type: BottomNavigationBarType.shifting, // type ของ BottomNavigation Bar กำหนดให้เป็น shifting เเบบ shifting จะสามารถเปลี่ยนสี background ได้
        iconSize: 35,
        items: const [ // items สำหรับสร้าง icon เเละ text เพื่อให้เป็นปุ่มสำหรับกดไปยังหน้าต่างๆได้
          BottomNavigationBarItem( // สร้าง BottomNavigation Bar ตามจำนวนข้อมูลใน Array tabs
              icon: Icon(Icons.production_quantity_limits), // สร้าง icon
              label: 'สินค้า', // สร้าง text
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'ตะกร้าสินค้า',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'บัญชีของฉัน',
              backgroundColor: Colors.orange),

        ],
        onTap: (index) { // onTap เพื่อเซ็ท _currentIndex
          setState(() { // เมื่อกดที่ icon ต่างๆบน BottomNavigation Bar ให้ทำการเซ็ท _currentIndex ให้ตรงตาม index ของ BottomNavigation Bar ที่ถูกกด เพื่อให้การเเสดงผลข้อมูลทำได้อย่างถูกต้อง
            _currentIndex = index;
          });
        },
      ),
    );
  }
}