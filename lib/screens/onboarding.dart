import 'package:flutter/material.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  PageController _pageController = PageController();

  bool onLastPage = false;

  void lastPage (index) {
  if (index == 2) {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300), 
      curve: Curves.ease);
    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
               
  }
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              onLastPage
              ?
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ):
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15))
            ],
          ),
          Container(
            child: Expanded(
                child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                OnboardingWidget(
                    image: "assets/images/food.png",
                    textContent: "Improve your diet"),
                OnboardingWidget(
                    image: "assets/images/exercise.png",
                    textContent: "Become active"),
                OnboardingWidget(
                    image: "assets/images/happy.png",
                    textContent: "Have a healthier quality of life"),
              ],
            )),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: JumpingDotEffect(),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    ));
  }
}

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget(
      {Key? key, required this.image, required this.textContent})
      : super(key: key);

  final String image, textContent;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Center(
          child: Image.asset(
            widget.image,
            height: 350,
          ),
        ),
        Spacer(),
        Text(
          widget.textContent,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Spacer()
      ],
    );
  }
}
