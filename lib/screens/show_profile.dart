import 'package:flutter/material.dart';

class show_proile extends StatelessWidget {
  const show_proile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.teal[900]
          ),
        ),
        leading:   BackButton(
          color: Colors.teal[900],
          onPressed: () {
            Navigator.of(context).pop();
          },
          ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: profileShow()
    );
  }
}



class profileShow extends StatefulWidget {
  const profileShow({ Key? key }) : super(key: key);

  @override
  State<profileShow> createState() => _profileShowState();
}

class _profileShowState extends State<profileShow> {

var profileImage = Center(
  child: Stack(
  children: [
    Container(
      width: 130,
      height: 130,
      // decoration: BoxDecoration(),
      child: CircleAvatar(
        foregroundImage: NetworkImage("https://images.app.goo.gl/eaGBT5VP2Sjv8VnY9"),
      ),
    ),
    Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Colors.white),
        ),
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ))
  ],
),
); 

var fullName = TextField(
  decoration: InputDecoration(
    labelText: "Full Name",
    contentPadding: EdgeInsets.only(bottom: 3),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintText: "Your Name",
    hintStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black
    )
  ),
);

//gender display
var genderDisplay = TextField(
  decoration: InputDecoration(
    labelText: "Gender",
    contentPadding: EdgeInsets.only(bottom: 3),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintText: "Gender",
    hintStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black
    )
  ),
);


//age range display
var ageRange = TextField(
  decoration: InputDecoration(
    labelText: "Age Range",
    contentPadding: EdgeInsets.only(bottom: 3),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintText: "Age Range",
    hintStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black
    )
  ),
);



var accDetails = Text("Account details",
    style: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.w400
    ),
    );


//to update profile page
final update_Button = ElevatedButton(
      onPressed: () {
        //navigates to complete profile page
        
      },
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
          "Update Profile",
          style: TextStyle(
           color: Colors.white,
           fontSize: 20.0,
           fontWeight: FontWeight.bold
          ),
        ),
      ));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
                  profileImage,
                  SizedBox(height: 35),
                  accDetails,
                  SizedBox(height: 35),
                  fullName,
                  SizedBox(height: 35),
                  ageRange,
                  SizedBox(height: 35),
                  genderDisplay,
                  SizedBox(height: 35),
                  update_Button
            ],
          ),
        ),
      ),
    );
  }
}