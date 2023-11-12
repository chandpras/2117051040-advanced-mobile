import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justduit/screens/root_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  bool isNameValid = false;

  void setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  void redirect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("name")){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RootScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }

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
                      Text("Nama"),
                      Text("*", style: TextStyle(color: Colors.red),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      errorText: isNameValid ? null : "Nama tidak valid",
                    ),
                  ),

                  SizedBox(height: 16,),

                  // Row(
                  //   children: [
                  //     Text("Password"),
                  //     Text("*", style: TextStyle(color: Colors.red),)
                  //   ],
                  // ),
                  // SizedBox(height: 8,),
                  // TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(16)
                  //     )
                  //   ),
                  // ),

                  SizedBox(height: 16,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isNameValid = nameController.text.isNotEmpty;
                        });

                        if(isNameValid) {
                          setName(nameController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => RootScreen()));
                        }
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