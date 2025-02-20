import 'package:flutter/material.dart';

class CustomerSignup extends StatefulWidget {
  const CustomerSignup({super.key});

  @override
  State<CustomerSignup> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends State<CustomerSignup> {
  TextEditingController _SignupEmailController = TextEditingController();
  TextEditingController _SignupPasswordController = TextEditingController();

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
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              Form(
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
                      controller: _SignupEmailController,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
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
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
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
              top: 750,
              right: 290,
              height: 200,
              width: 200,
              child: Image.asset("assets/images/Landing_Images/purple.png")),
          Positioned(
              top: -70,
              left: 200,
              height: 300,
              width: 300,
              child: Image.asset("assets/images/Landing_Images/6.png")),
        ],
      ),
    );
  }
}
