import 'package:flutter/material.dart';
import 'package:health_app/screens/signup.dart';
import 'package:health_app/screens/home_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  //form key for getting state of the form
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Welcome back text area
    var welcomeArea = Container(
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 110.0),
          child: Text("Welcome Back",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.0)),
        ),
      ]),
    );

    //email field
    final emailField = TextField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // validator: () {},
      // onSaved: (value) {
      //     emailController.text = value!;
      // },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );

    //password field
    final passwordField = TextField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      // validator: () {},
      // onSaved: (value) {
      //     emailController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );

    final login_button = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(35),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
           
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
           
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        color: Colors.teal[900],
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //welcomeArea,
                    SizedBox(height: 20.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 35.0),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: login_button,
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registration()));
                            },
                            child: Text(
                              "Sign up!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}

