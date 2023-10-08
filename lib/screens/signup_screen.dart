import 'package:flutter/material.dart';
import 'package:justduit/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController nameController = TextEditingController();
  bool isNameValid = true;

  TextEditingController emailController = TextEditingController();
  bool isEmailValid = true;

  TextEditingController passwordController = TextEditingController();
  bool isPasswordValid = true;

  TextEditingController confirmController = TextEditingController();
  bool isConfirmValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 251),
      body: Center(
        child: SingleChildScrollView(
          padding : EdgeInsets.only(top: 65),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/justduit.png", width: 199, height: 54),
        
              Padding(
                      padding: EdgeInsets.only(top: 36, bottom: 16, left: 21, right: 21),
                      child: Text("Sign Up Now and Unlock the Power of Justduit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black), textAlign: TextAlign.center)
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
                        Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
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
                          errorText: isNameValid ? null : "Nama tidak boleh kosong",
                      ),
                    ),
        
                    SizedBox(height: 16,),
        
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
                          errorText: isEmailValid ? null : "Email tidak valid",
                      ),
                    ),
        
                    SizedBox(height: 16,),
        
                    Row(
                      children: [
                        Text("Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 246, 248, 251)),
                          borderRadius: BorderRadius.circular(8)),
                          errorText: isPasswordValid ? null : "Password tidak valid",
                      ),
                    ),
        
                    SizedBox(height: 16,),
        
                    Row(
                      children: [
                        Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text("*", style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    TextField(
                      controller: confirmController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 246, 248, 251)),
                          borderRadius: BorderRadius.circular(8)),
                          errorText: isConfirmValid ? null : "Field harus sama dengan password",
                      ),
                    ),

                    SizedBox(height: 16,),
        
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color(0xFF1E90FF)),foregroundColor:MaterialStateProperty.all<Color>(Colors.white),),
                              onPressed: () {
                                setState(() {
                                  isNameValid = nameController.text.isNotEmpty;
                                  isEmailValid = emailController.text.isNotEmpty;
                                  isPasswordValid = passwordController.text.isNotEmpty;
                                  isConfirmValid = confirmController.text == passwordController.text;
                                });
                              },
                            child: Text("Continue",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
                          )
                        ),
                    ),
        
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text("Sign In", style: TextStyle(color: Color.fromARGB(255, 164, 168, 174)),)
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