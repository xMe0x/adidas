import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Women", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Men", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Kids", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Banner Image
     AspectRatio(
  aspectRatio: 16 / 9, // หรือใช้ MediaQuery คำนวณจากขนาดหน้าจอ
  child: Image.asset(
    'assets/images/promotions.jpg',
    fit: BoxFit.contain, // ป้องกันการซูมภาพ
  ),
),

            // List Items
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildListTile('assets/icons/shoes.png', "SHOES"),
                _buildListTile('assets/icons/polo-shirt.png', "CLOTHING"),
                _buildListTile('assets/icons/hat.png', "ACCESSORIES"),
              ],
            ),

            // Grid Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 คอลัมน์
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2, // ทำให้ช่องมีขนาดเท่ากัน
                ),
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> menuItems = [
                    {"icon": Icons.percent, "title": "SALE"},
                    {"icon": Icons.sports, "title": "SPORT"},
                    {"icon": Icons.local_fire_department, "title": "NEW & TRENDING"},
                    {"icon": Icons.card_giftcard, "title": "GIFT CARDS"},
                  ];
                  return _buildMenuItem(menuItems[index]['icon'], menuItems[index]['title']);
                },
              ),
            ),
          ],
        ),
        
      ),
      backgroundColor: Colors.white,
    );
  }

  // ✅ ฟังก์ชันสร้าง ListTile
  Widget _buildListTile(String imagePath, String title) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(imagePath, width: 30, height: 30),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(),
      ],
    );
  }

  // ✅ ฟังก์ชันสร้าง Grid Menu Item (ไม่มีที่ว่างข้างล่าง/ข้างบน)
  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(height: 2),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // ให้ข้อความอยู่ตรงกลาง
            ),
          ],
        ),
      ),
    );
  }
}
