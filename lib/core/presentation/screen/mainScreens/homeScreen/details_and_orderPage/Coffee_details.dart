import 'package:coffee/core/common/colors/coffeColors.dart';
import 'package:coffee/core/data/model/coffee_model.dart';
import 'package:coffee/core/presentation/screen/mainScreens/homeScreen/orderPage.dart';
import 'package:flutter/material.dart';

class CoffeeDetails extends StatefulWidget {
  final CoffeeModel coffeeDetails;
  CoffeeDetails({super.key, required this.coffeeDetails});

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    final coffee = widget.coffeeDetails;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AppBar(),
                    image(coffee.imageUrl),
                    Text(
                      coffee.name,
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Ice/Hot",
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14,
                        color: CoffeColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 10),
                        Text('(Good Ratings)'),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "A ${coffee.name} is an approximately 150 ml (5 oz) beverage, with ${coffee.sugarLevel} sugarLevel and ${coffee.description} ",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    Text(
                      "Available sizes",
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20), // scroll test
                    //sized
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: CoffeColors.darkButton),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "S",
                            style: TextStyle(
                              color: CoffeColors.darkButton,
                              fontSize: 13,
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: CoffeColors.darkButton,
                            //  border: Border.all(color: CoffeColors.darkButton),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "M",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: CoffeColors.darkButton),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "L",
                            style: TextStyle(
                              color: CoffeColors.darkButton,
                              fontSize: 13,
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: CoffeColors.darkButton,
                            //  border: Border.all(color: CoffeColors.darkButton),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "XL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: 10),
                    Divider(),
                  SizedBox(height: 13,),
                  Text('We Offered',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  specify(),

                   SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price',style: TextStyle(fontSize: 20,color: Colors.grey),),
                          Text('₹ ${coffee.price}',style: TextStyle(color: CoffeColors.darkButton,fontWeight: FontWeight.bold,fontSize: 24),textAlign: TextAlign.start,)
                        ],
                      ),
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Orderpage()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                            color: CoffeColors.darkButton,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Sora'),),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }

  //image
  Widget image(image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.network(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget specify() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Container(
            child: Row(
              children: [
                 Image.asset('assets/images/coffee-cup.gif',scale: 9,),
                 SizedBox(width: 15,),
                 Text('we offered Hot coffees ',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Container(
            child: Row(
              children: [
                 Image.asset('assets/images/ice-coffee.gif',scale: 9,),
                 SizedBox(width: 15,),
                 Text('we offered Ice coffees ',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Container(
            child: Row(
              
              children: [
                 Image.asset('assets/images/scooter.gif',scale: 9,),
                 SizedBox(width: 15,),
                 Text('Fast and hygiene delivery ',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
