import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomeScreens/HomeScreenOfApp.dart';

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  TextEditingController _LoginEmailController = TextEditingController();
  TextEditingController _LoginPasswordController = TextEditingController();

  ///form key
  final LoginKey = GlobalKey<FormState>();

  ///login with the Email and Password

  Future<void> LoginUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _LoginEmailController.text.trim(),
        password: _LoginPasswordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logged In Successfully")),
      );

      // Navigate to home screen after successful login
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreenofapp(),
        ),
        (route) => false,
      );

      // Clear text fields after login
      _LoginPasswordController.clear();
      _LoginEmailController.clear();

      print("User logged in successfully.");
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      } else {
        errorMessage = e.message ?? "An error occurred.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );

      print("Login error: ${e.message}");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred.")),
      );

      print("Unexpected error: $e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _LoginEmailController.dispose();
    _LoginPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: Stack(
        children: [
          Positioned(
              top: 30,
              left: 6,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              Form(
                  key: LoginKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, bottom: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.black)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "Email",
                                style: TextStyle(color: Colors.black),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Email";
                            } else {
                              return null;
                            }
                          },
                          controller: _LoginEmailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.red)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "Password",
                                style: TextStyle(color: Colors.black),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Password";
                            } else {
                              return null;
                            }
                          },
                          controller: _LoginPasswordController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 15,
                          right: 20,
                        ),
                        child: SizedBox(
                          height: 40,
                          width: 350,
                          child: ElevatedButton(
                            onPressed: () {
                              if (LoginKey.currentState!.validate()) {
                                LoginUserWithEmailAndPassword();
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(11),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(242, 144, 87, 1))),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Positioned(
              top: 600,
              right: 150,
              height: 350,
              width: 350,
              child:
                  Image.asset("assets/images/Landing_Images/bluesticks.png")),
          Positioned(
              top: -70,
              left: 200,
              height: 300,
              width: 300,
              child: Image.asset("assets/images/Landing_Images/4.png")),
        ],
      ),
    );
  }
}
