import 'package:coffee/core/common/colors/coffeColors.dart';
import 'package:coffee/core/presentation/screen/mainScreens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  Future<void> _CompleteOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false); // ✅ Mark onboarding as done

    // Navigate to HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
        
            //text area
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                'Fall in love with Coffee in Blissful Delight!',
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'Welcome to our vonto coffee corner , where every cup is a delightful for you.',
                style: TextStyle(fontSize: 20, color: CoffeColors.darkGrey),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
        
            //button aera
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.80, 60),
                  backgroundColor: CoffeColors.darkButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed:  () => _CompleteOnboarding(context),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
