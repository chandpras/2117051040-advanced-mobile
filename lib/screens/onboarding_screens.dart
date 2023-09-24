import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/bsn.png'),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), 
                color: Colors.red
              ),
              child: Column(
                children: [
                  Text("Mari Bergabung Bersama Kami!", style: TextStyle(fontSize: 24, color: Colors.white), textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Hubungi nomor di bawah.", style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {}, child: Text("Daftar")))
                ],
                ),
            ),
            // Container(
            //   margin: EdgeInsets.all(16), 
            //   height: 200, 
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16), 
            //     color: Colors.red
            //   )
            // )
          ],
        )
      )
    );
  }
}