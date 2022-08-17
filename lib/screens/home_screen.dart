import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:health_app/screens/bmi.dart';
import 'package:health_app/screens/sleep.dart';
import 'package:health_app/screens/steps.dart';
import 'package:health_app/size.dart';
import 'water.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    //This gives us total height and width
    var size = MediaQuery.of(context).size; 

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: peach,
      //   elevation: 0,
      //   leading: const BackButton(
      //     color: Colors.white,

      //     ),
      // ),
        
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
              width: double.infinity,
              height: size.height * .45,
              decoration: const BoxDecoration(
                          color: peach,
                          )),
               SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                          )
                      ),
                    const Padding(padding: const EdgeInsets.only(top: 15.0, left: 20.0)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Hello, \nAnthony",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.w900)
                      ),
                    ),
                     const SizedBox(height: 20),
                    Expanded(
                      child:  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: .85,
                      children: <Widget>[
                        pageCategories(
                          title: "Steps",
                          boxColor: orange,
                               press: () {
                                 Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Pedometer()));

                               },
                          categoryIcon: Icon(
                                Icons.directions_run_outlined,
                                color: Colors.teal[900],
                          ),
                        ),
                        // pageCategories(
                        //   title: "Sleep",
                        //   boxColor: orange,
                        //        press: () {
                        //         Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) => sleep_page()));
                          
                        //        },
                        //   categoryIcon: Icon(
                        //         Icons.bed,
                        //         color: Colors.teal[900],
                        //   ),
                        // ),
                        pageCategories(
                          title: "Nutrition",
                          boxColor: orange,
                          press: () {},
                          categoryIcon: Icon(
                                Icons.fastfood,
                                color: Colors.teal[900],
                          ),
                        ),
                        pageCategories(
                          title: "Weight",
                          boxColor: orange,
                          press: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => bmi_page()));
                          },
                          categoryIcon: Icon(
                                Icons.scale,
                                color: Colors.teal[900],
                          ),
                        ),
                        pageCategories(
                          title: "Water",
                          boxColor: orange,
                               press: () {
                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => water_page()));
                          },
                          categoryIcon: Icon(
                                Icons.local_drink,
                                color: Colors.teal[900],
                          ),
                        ),
                        pageCategories(
                          title: "Exercise",
                          boxColor: orange,
                          press: () {},
                          categoryIcon: Icon(
                                Icons.sports,
                                color: Colors.teal[900],
                          ),
                        )
                      ],
                      ),
                             ),
                         ]),
                    ),
                  
                      ),
           ] )
    
  ),
        );
         
  }
}


class pageCategories extends StatelessWidget {
  final VoidCallback press;
  final String title;
  final Widget categoryIcon;
  final Color boxColor;
  //final Widget centerWidget,

  const pageCategories({
    Key? key,
    required this.title,
    required this.categoryIcon,
    required this.press,
    required this.boxColor
//required this.centerWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 12,
              spreadRadius: -20,
             
            )
          ],
          border: Border.all(
            color: boxColor,
             width: 1),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      categoryIcon
                    ],
                  ),
                ),
                // Center(
                //   child: centerWidget,
                // )
              ],
            ),
          ),
        ));
  }
}
