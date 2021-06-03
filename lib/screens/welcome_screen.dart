import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller, iconController;
  late Animation animation, iconAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      //   upperBound: 100
    );
    iconController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.amberAccent[400], end: Colors.white)
        .animate(controller);
    iconAnimation =
        CurvedAnimation(parent: iconController, curve: Curves.easeIn);
    iconController.forward();
    controller.forward();
    int i = 0;
    iconAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed && i < 2) {
        iconController.reverse(from: 1.0);
        i++;
      } else if (status == AnimationStatus.dismissed) {
        iconController.forward();
        i++;
      }
    });
    iconController.addListener(() {
      setState(() {});
     // print(iconAnimation.value);
    });
    controller.addListener(() {
      setState(() {});
      //print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: iconAnimation.value * 70,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextLiquidFill(
                    text: 'Flash Chat',
                    textAlign: TextAlign.start,
                    boxHeight: 50,
                    waveColor: Colors.deepOrange,
                    boxBackgroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(Colors.amberAccent,LoginScreen.id,"Login Screen",),
            RoundButton(Colors.orange,RegistrationScreen.id,"Registration Screen",)
          ],
        ),
      ),
    );
  }
}
