import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late AnimationController controller, iconController;
  late Animation animation, iconAnimation;
  @override
  void initState(){
    super.initState();
    controller= AnimationController(
      duration: Duration(seconds: 1),
      vsync:this,
   //   upperBound: 100
    );
    iconController= AnimationController(vsync: this,duration: Duration(seconds:1));
    animation = ColorTween(begin: Colors.amberAccent[400], end: Colors.white).animate(controller);
    iconAnimation = CurvedAnimation(parent: iconController, curve: Curves.easeIn);
    iconController.forward();
    controller.forward();
    int i=0;
    iconAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed && i <2){
        iconController.reverse(from:1.0);
      i++;}
      else if (status == AnimationStatus.dismissed ) {
        iconController.forward();
        i++;
      }
    });
    iconController.addListener(() {
      setState((){
      });
      print(iconAnimation.value);
    });
    controller.addListener(() {
      setState(() {
      });
      print(animation.value);
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                    height: iconAnimation.value*70,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                    //Go to login screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}