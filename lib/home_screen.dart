import 'package:adidas/adiclub_screen.dart';
import 'package:adidas/favorite_screen.dart';
import 'package:adidas/search_screen.dart';
import 'package:adidas/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:adidas/navigationMap.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  final Map<int,Map<String, Widget>> _navigation = { 
    0: {"title": const Text("Home"), "screen": Container()},
      1: {"title": const Text("Search"),   "screen": const SearchScreen()},
      2: {"title": const Text("Favorite"), "screen": const FavoriteScreen()},
      3: {"title": const Text("Shop"),     "screen": const ShopScreen()},
      4: {"title": const Text("Adiclub"),  "screen": const AdiclubScreen()},
    };

  @override
  Widget build(BuildContext context) {
    // สร้าง instance ของ Navigationmap
    // เพื่อดึง navMap (title/screen) ไปใช้งานใน IndexedStack
  

    // ดึง Map จาก navigation

    // แปลง navMap เป็น List ของ screen
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SHOP",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            )
          ],
          backgroundColor: Colors.white,

        ),
        body: IndexedStack(
          
          index: _selectedIndex,
           children: _navigation.values.map((page) => page["screen"]!).toList(), 
       
        ),
      bottomNavigationBar: Navigationmap(
  onItemTapped: (index) {
    setState(() {
      _selectedIndex = index; // อัปเดตค่า index ที่เลือก
    });
  },
  selectedIndex: _selectedIndex,  
    // ส่งค่าไปให้ BottomNavigationBar
),
      ),
    );
  }
}
