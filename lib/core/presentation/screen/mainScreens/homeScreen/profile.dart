import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',style: TextStyle(fontFamily: 'Sora',fontWeight: FontWeight.bold),),
      ),
      body:Center(
        
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Icon(Icons.favorite_border,color: Colors.grey,size:50),
        //     Text('You have no favorite items yet!',style: TextStyle(color: Colors.grey,fontSize: 22),),
        //      Text('Tap the heart icon on any coffee to add it here',style: TextStyle(color: Colors.grey,fontSize: 16),)
        //   ],
        // ),
      ) ,
    );
  }
}