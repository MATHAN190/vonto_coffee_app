import 'package:coffee/core/common/colors/coffeColors.dart';
import 'package:coffee/core/presentation/screen/mainScreens/homeScreen/homeScreen.dart';
import 'package:coffee/core/presentation/screen/mainScreens/homeScreen/orderPage.dart';
import 'package:coffee/core/presentation/screen/mainScreens/homeScreen/profile.dart';
import 'package:coffee/core/presentation/screen/mainScreens/homeScreen/wishList.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _page = 0;
  final pages = [
    const Homescreen(),
    const Wishlist(),
    const Orderpage(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: CoffeColors.darkButton,
          height: 55,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          index: _page,
          items: const <Widget>[
            Icon(Icons.home, size: 25, color:  Colors.white),
            Icon(Icons.favorite_border, size: 25, color: Colors.white),
            Icon(Icons.shopping_cart_outlined, size: 25, color: Colors.white),
            Icon(Icons.person_outline, size: 25, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
    );
  }
}
