import 'package:flutter/material.dart';

class Orderpage extends StatelessWidget {
  const Orderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Orders',style: TextStyle(fontFamily: 'Sora',fontWeight: FontWeight.bold),),
      ),
      body:Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,color:  Colors.grey,size:50),
            Text('You have Ordered  items yet!',style: TextStyle(color: Colors.grey,fontSize: 22),),
             Text('Place Your order Now',style: TextStyle(color: Colors.grey,fontSize: 16),)
          ],
        ),
      ) ,
    );
  }
}