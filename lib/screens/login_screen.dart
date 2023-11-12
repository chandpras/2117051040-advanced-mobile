import 'package:flutter/material.dart';
import 'package:justduit/screens/root_screen.dart';
import 'package:justduit/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  bool isEmailValid = true;

  TextEditingController nameController = TextEditingController();
  bool isNameValid = true;

    void setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  void setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
  }

  void redirect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("name") && prefs.containsKey("email")){
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/justduit.png", width: 199, height: 54),
        
              Padding(
                      padding: EdgeInsets.only(top: 36, bottom: 16),
                      child: Text("Hi, Welcome Back to Justduit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black), textAlign: TextAlign.center)
              ),
        
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
        
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Email Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 246, 248, 251)),
                          borderRadius: BorderRadius.circular(8)),
                          errorText: isEmailValid ? null : "E-mail tidak valid",
                      ),
                    ),
        
                    SizedBox(height: 16,),
        
                    Row(
                      children: [
                        Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 246, 248, 251)),
                          borderRadius: BorderRadius.circular(8)),
                          errorText: isNameValid ? null : "Nama tidak valid",
                      ),
                    ),
        
                    Padding(
                      padding: EdgeInsets.only(left: 196),
                      child: TextButton(
                        onPressed: () {
        
                        },
                        child: Text("Forgot Account", style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),)
                        ),
                    ),
        
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color(0xFF1E90FF)),foregroundColor:MaterialStateProperty.all<Color>(Colors.white),),
                              onPressed: () {
                                setState(() {
                                  isEmailValid = emailController.text.isNotEmpty;
                                  isNameValid = nameController.text.isNotEmpty;
                                });

                                if(isEmailValid && isNameValid) {
                                  setName(nameController.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => RootScreen()));
                                }
                              },
                            child: Text("Sign In Now",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
                          )
                        ),
                    ),
        
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                        },
                        child: Text("Create New Account", style: TextStyle(color: Color.fromARGB(255, 164, 168, 174)),)
                        ),
                    )
        
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}