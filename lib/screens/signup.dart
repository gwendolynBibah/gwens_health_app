import 'package:flutter/material.dart';
import 'package:health_app/screens/complete_profile.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //our form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );

    //confirm password field
    final confirmPasswordField = TextField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      // validator: () {},
      // onSaved: (value) {
      //     emailController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );
    
    final register_Button = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(35),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Complete_Profile()));
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        color: Colors.teal[900],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.teal[900],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
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
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(height: 25.0),
                  confirmPasswordField,
                  SizedBox(height: 35.0),
                  register_Button,
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
