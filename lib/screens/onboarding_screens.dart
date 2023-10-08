import 'package:flutter/material.dart';
import 'package:justduit/screens/form_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 251),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/mobile1.png',width: 200, height: 187),

            SizedBox(height: 40),
            
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text("Let's start the journey", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black), textAlign: TextAlign.center)
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: Text("Experience seamless digital transactions with JustDuit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 164, 168, 174)), textAlign: TextAlign.center)
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: SizedBox(
                      width: 294,
                      height: 52,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color(0xFF1E90FF)),foregroundColor:MaterialStateProperty.all<Color>(Colors.white),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen()));
                        }, child: Text("Get Started",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),)
                        )
                    )
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 14),
                      child: InkWell( onTap: () {}, child: Text("I already have an account", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 164, 168, 174)), textAlign: TextAlign.center)
                      )
                  ),
                  
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}