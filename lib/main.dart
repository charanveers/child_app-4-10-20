import 'package:flutter/material.dart';
import 'dart:async';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swish_child_app/app/utils/data_utils.dart';
import 'package:swish_child_app/app/pages/home_screen.dart';
import 'package:swish_child_app/app/pages/login_screen.dart';
import 'package:swish_child_app/app/pages/introduction_screen.dart';
import 'app/pages/child_boy/donate.dart';
import 'app/pages/child_boy/donate_about.dart';
import 'app/pages/child_boy/my_acadim.dart';
import 'app/pages/child_boy/reward_donate.dart';
import 'app/pages/child_home.dart';
import 'app/pages/my_activity.dart';


void main() {
  runApp(EndlessFactory());
}

class EndlessFactory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwishChildApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {'login': (BuildContext context) => new LoginScreen(),
        'home': (BuildContext context) => new HomeScreen(),
        'splash': (BuildContext context) => new SplashScreen(),
        'intro': (BuildContext context) => new IntroductionScreen(),
        'activty': (BuildContext context) => new MyActivity(),
      },
      home: HomeScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
  }
  _fetchSessionAndNavigate() async {
    Timer(Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String introSliderShown = DataUtils.getData(prefs, 'intro_slider_shown');
      if(introSliderShown == 'true'){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String authToken = DataUtils.getData(prefs, 'auth_token');
        if (authToken == null){
          Navigator.pushReplacementNamed(context, 'login');
        } else{
          Navigator.pushReplacementNamed(context, 'home');
        }
      }
      else{
        Navigator.pushReplacementNamed(context, 'intro');
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tab back again to exit', style: TextStyle(color: Colors.white)), 
          backgroundColor: Colors.black87
        ),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'lib/app/assets/logo.jpg', 
                            height: 240, width: MediaQuery.of(context).size.
                            width * 0.8
                          ),
                          // Text(
                          //   'Lorem Ispum generator', 
                          //   style: TextStyle(
                          //     color: Color(0xff242d31),
                          //     fontSize: 20
                          //   )
                          // )
                        ],
                      ),
                    )
                ]
              )
            ],
          )
        )
      )
    );
  }
}