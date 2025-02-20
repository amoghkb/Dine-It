import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dineit/src/Pages/LandingPages/Customer_Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerSignup extends StatefulWidget {
  const CustomerSignup({super.key});

  @override
  State<CustomerSignup> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends State<CustomerSignup> {
  TextEditingController _SignupEmailController = TextEditingController();
  TextEditingController _SignupPasswordController = TextEditingController();
  TextEditingController _SignupNameController = TextEditingController();

  ///Form Key
  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  ///create user
  Future CreateUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _SignupEmailController.text.trim(),
          password: _SignupPasswordController.text.trim());

      // Save user details to Firestore
      await FirebaseFirestore.instance.collection("Users").add({
        "Name": _SignupNameController.text.trim(),
        "Email": _SignupEmailController.text.trim(),
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign Up Successful")),
      );

      // Navigate to login screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerLogin(),
        ),
      );

      // Clear text fields
      _SignupEmailController.clear();
      _SignupPasswordController.clear();
      _SignupNameController.clear();

      print("User created successfully");
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "An error occurred during sign-up";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print(e.message);
    }
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
              icon: Icon(Icons.arrow_back_outlined),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              Form(
                key: SignUpFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 15),
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
                            "Name",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Name";
                          } else {
                            return null;
                          }
                        },
                        controller: _SignupNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 15),
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
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          } else {
                            return null;
                          }
                        },
                        controller: _SignupEmailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 15),
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
                            "Password",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          } else {
                            return null;
                          }
                        },
                        controller: _SignupPasswordController,
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
                            if (SignUpFormKey.currentState!.validate()) {
                              CreateUserWithEmailAndPassword();
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(11),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(242, 144, 87, 1)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 750,
            right: 290,
            height: 200,
            width: 200,
            child: Image.asset("assets/images/Landing_Images/purple.png"),
          ),
          Positioned(
            top: -70,
            left: 200,
            height: 300,
            width: 300,
            child: Image.asset("assets/images/Landing_Images/6.png"),
          ),
        ],
      ),
    );
  }
}
