import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:justduit/app/routes/app_pages.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  
  const FormView({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 251),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Google_logo_%282013-2015%29.svg/1024px-Google_logo_%282013-2015%29.svg.png", width: 200),

            SizedBox(height: 40),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("E-Mail"),
                      Text("*", style: TextStyle(color: Colors.red),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      errorText: controller.isEmailValid.value ? null : "E-mail tidak valid",
                    ),
                  ),

                  SizedBox(height: 16,),

                  Row(
                    children: [
                      Text("Password"),
                      Text("*", style: TextStyle(color: Colors.red),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                  ),

                  SizedBox(height: 16,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // controller.isEmailValid.value = controller.emailController.text.isNotEmpty;
                        Get.toNamed(Routes.COUNTER);
                      },
                     child: Text("Daftar")
                    ),
                  ),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Kembali")),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
