import 'package:adidas/home_screen.dart';
import 'package:flutter/material.dart';

// import หน้าต่าง ๆ ที่จะใช้เป็น screen ในแต่ละแท็บ
import 'package:adidas/adiclub_screen.dart';
import 'package:adidas/favorite_screen.dart';
import 'package:adidas/search_screen.dart';
import 'package:adidas/shop_screen.dart';



class Navigationmap extends StatefulWidget {
  final Function(int) onItemTapped; // เพิ่ม callback function
  final int selectedIndex; // รับค่าปัจจุบัน

  const Navigationmap({super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  State<Navigationmap> createState() => _Navigationmap();
}
  class _Navigationmap extends State<Navigationmap>{


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
         currentIndex: widget.selectedIndex, // ใช้ค่าจาก HomeScreen
      onTap: (index) {
        widget.onItemTapped(index); // ส่งค่าไปที่ HomeScreen
      },
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/logo.png',
            width: 30,
            height: 30,
          ),
          label: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/adiclub.png',
            width: 45,
            height: 45,
          ),
          label: "",
        ),
      ],
    );
  }
}
