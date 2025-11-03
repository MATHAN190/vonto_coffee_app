import 'package:flutter/material.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
       body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                 _AppBar()
              ],
            ),
          )
        ],
       ),     
    ));
  }
  
  Widget _AppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            "Details",
            style: TextStyle(fontSize: 24, fontFamily: 'Sora'),
          ),
        ),
       
      ],
    );
  }
}