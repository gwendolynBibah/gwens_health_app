import 'package:flutter/material.dart';
import 'package:health_app/screens/signup.dart';


class Complete_Profile extends StatefulWidget {
  const Complete_Profile({ Key? key }) : super(key: key);

  @override
  State<Complete_Profile> createState() => _Complete_ProfileState();
}

class _Complete_ProfileState extends State<Complete_Profile> {
  //form key for getting the state of the form
  final _formKey = GlobalKey<FormState>();

  //editing controllers for the text areas
  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController(); 

  @override
  Widget build(BuildContext context) {

    //Back button
    var backButton = BackButton(
      color: Colors.teal[900],
      onPressed: (){
        Navigator.of(context).pop();
      },
    );

    //complete registration field
    final profileText = Text(
      "Complete Your Profile For A Personalized App Experience.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.teal[700],
        fontSize: 20.0
        )
      );

    //first name field
     final firstNameField = TextField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.contact_phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );

    //last name field
    final lastNameField = TextField(
      autofocus: false,
      controller: lastNameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.contact_phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );

    //value for drop down menu button
  var _dropdownValue;

    //function carried out if drop down menu item is selected. A void call back was used instead
    VoidCallback? newItemCallback(selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    //gender menu
    final genderDropDown = DropdownButtonFormField(items: const [
      DropdownMenuItem(
        child: Text('Male'), 
        value: 'Male'),
      DropdownMenuItem(
        child: Text('Female'), 
        value: 'Female')
    ],
     value: _dropdownValue,
     onChanged: newItemCallback,
     decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
     hint: Text(
      "Select Your Gender"
     ),
     );

     //age menu
    //age items
    final ageDropDown = DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
          child: Text('16-25'),
          value: '16-25',
        ),
        DropdownMenuItem(
          child: Text('26-35'),
          value: '26-35',
        ),
        DropdownMenuItem(child: Text('36-45'), value: '36-45'),
        DropdownMenuItem(
          child: Text('46-55'),
          value: '46-55',
        )
      ],
      onChanged: newItemCallback,
      hint: Text("Select Your Age"),
      value: _dropdownValue,
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
    );

    final complete_Button = ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.fromLTRB(20, 15, 20, 15)
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 77, 64, 1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )
        )
      ),
      child: Center(
        child: Text(
          "Complete Profile",
          style: TextStyle(
           color: Colors.white,
           fontSize: 20.0,
           fontWeight: FontWeight.bold
          ),
        ),
      ));
   
      var size= MediaQuery.of(context).size;//for getting the size of the screen

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: backButton,
        ),
        body: Center(
        child: SingleChildScrollView(
          child: Container(
            //allows the page to take up 80% of the screen
            height: size.height * 80,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(36.0, 5.0, 36.0, 5.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    profileText,
                    SizedBox(
                      height: 55.0,
                    ),
                    firstNameField,
                    SizedBox(
                      height: 15.0,
                    ),
                    lastNameField,
                    SizedBox(
                      height: 15.0,
                    ),
                    genderDropDown,
                    SizedBox(
                      height: 15.0
                    ),
                    ageDropDown,
                    SizedBox(
                      height: 55.0,
                    ),
                    complete_Button
                  ],
                ) 
                ),
              ),
          ),
        )
        ),
       
    );
  }
}