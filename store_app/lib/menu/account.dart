import 'package:flutter/material.dart';
import '../UserServices.dart';
import '../models/user.dart';

// สร้าง class ที่เป็น StatefulWidget , Stateful หมายถึง Widget ที่มี state หรือมีสภาวะการเปลี่ยนเเปลง ไปตามข้อมูลที่ได้รับ
// หรือจากการกำหนดจากผู้ใช้ เช่น เมื่อเรากดปุ่ม ok เเล้วเเสดงข้อความ นาย ก ได้เข้าระบบ
// โดยตั้งชื่อ class ให้สอดคล้องกับชื่อไฟล์
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late User user;
  late String title;

  @override
  void initState() {
    super.initState();
    title = 'Loading products...';
    user = User();

    Services.getUser().then((usersFromServer) {
      setState(() {
        user = usersFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บัญชีของฉัน'),
        backgroundColor: Colors.blue, // เปลี่ยนสี AppBar
      ),
      backgroundColor: Colors.grey[200], // เปลี่ยนสีพื้นหลังหน้าต่าง Scaffold
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 3.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // เงาสีเทา
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // เปลี่ยนตำแหน่งเงา
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/700/700674.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${user.name.firstname} ${user.name.lastname}',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Email: ${user.email}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone,
                  size: 20.0,
                  color: Colors.blue, // สี Icon
                ),
                SizedBox(width: 5.0),
                Text(
                  'Phone Number: ${user.phone}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              elevation: 8.0,
              margin: EdgeInsets.all(10.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ที่อยู่:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Number: ${user.address.number}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'City: ${user.address.city}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'Street: ${user.address.street}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'Zipcode: ${user.address.zipcode}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 20.0,
                          color: Colors.blue, // สี Icon
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Phone: ${user.phone}', // เพิ่มข้อมูลโทรศัพท์
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue, // สีข้อความ
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}