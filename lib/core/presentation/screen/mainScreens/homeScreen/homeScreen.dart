import 'package:coffee/core/common/colors/coffeColors.dart';
import 'package:coffee/core/data/source/coffee_remote_data_source.dart';
import 'package:coffee/core/presentation/screen/mainScreens/homeScreen/details_and_orderPage/Coffee_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:coffee/core/data/model/coffee_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late List<CoffeeModel> coffeeList;
  final CoffeeRemoteDataSource coffeeRemoteDataSource =
      CoffeeRemoteDataSource();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await coffeeRemoteDataSource.getCoffees();
      setState(() {
        coffeeList = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(), _Promo(),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: selectedList(),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: isLoading ? coffeGridSkeleton() : coffeeGrid(),
              ),
              // GridView
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location', style: TextStyle(color: CoffeColors.lightshade)),
          SizedBox(height: 5),
          Row(
            children: [
              Text('Chennai,', style: TextStyle(color: CoffeColors.lightshade)),
              Text(
                'Tamil nadu',
                style: TextStyle(color: CoffeColors.lightshade),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          SizedBox(height: 10),

          TextField(
            decoration: InputDecoration(
              hintText: 'Search cofee',
              filled: true,
              fillColor: Colors.grey.shade800,
              prefixIcon: Icon(Icons.search, color: Colors.white70),
              suffixIcon: Icon(Icons.tune, color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _Promo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/promo.jpg'),
            fit: BoxFit.cover,
          ),
          color: CoffeColors.lightBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Promo', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              Text(
                'Buy one get one Free',
                style: TextStyle(fontSize: 25, color: Colors.white,fontFamily: 'Sora'),textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget coffeGridSkeleton() {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.brown.shade50,
          highlightColor: Colors.brown.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(''),
          ),
        );
      },
    );
  }

  Widget coffeeGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: coffeeList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final coffee = coffeeList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> CoffeeDetails(coffeeDetails: coffee,))
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      coffee.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    coffee.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Sora'),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "₹${coffee.price}",
                    style: TextStyle(color: Colors.brown),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget selected() {
  return Row(
    children: [
      Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            color: CoffeColors.darkButton,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('All', style: TextStyle(color: Colors.white)),
        ),
      ),

      //latte
      SizedBox(width: 15),
      Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            // border: Border.all(color: CoffeColors.darkButton),
            color: CoffeColors.lightBackground,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('Latte', style: TextStyle(color: CoffeColors.darkButton)),
        ),
      ),
      SizedBox(width: 15),
      Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: CoffeColors.darkButton),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Cappuccino',
            style: TextStyle(color: CoffeColors.darkButton),
            maxLines: 1,
          ),
        ),
      ),
    ],
  );
}

Widget selectedList() {
  return SizedBox(
    height: 45,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: <Widget>[
        //  All
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            color: CoffeColors.darkButton,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text(
              'All',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 15),

        //  Latte
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            // border: Border.all(color: CoffeColors.darkButton),
            color: CoffeColors.lightshade,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'Latte',
              style: TextStyle(
                color: CoffeColors.darkButton,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 15),

        //  Cappuccino
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            // border: Border.all(color: CoffeColors.darkButton),
            color: CoffeColors.lightshade,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'Cappuccino',
              style: TextStyle(
                color: CoffeColors.darkButton,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            // border: Border.all(color: CoffeColors.darkButton),
            color: CoffeColors.lightshade,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'Espresso',
              style: TextStyle(
                color: CoffeColors.darkButton,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
