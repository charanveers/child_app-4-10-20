import 'package:flutter/material.dart';
import 'dart:async';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:swish_child_app/app/utils/data_utils.dart';

class IntroductionScreen extends StatefulWidget {
  IntroductionScreen({Key key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  
  @override
  void initState() {
    super.initState();
  }
  Color _blackColor = Color(0xff1f1f1f);
  Color _darkGreen = Color(0xff42bc6c);
  Color _lightGreen = Color(0xffceedd9);
  
  int _activeSlide = 1;

  _slideTitle(){
    if(_activeSlide == 1){
      return 'Your Wallet';
    } else if(_activeSlide == 2){
      return 'Chores & Health Goals';
    } else{
      return 'Home Controls';
    }
  }

  _slideImage(){
    if(_activeSlide == 1){
      return 'intro-slide1.png';
    } else if(_activeSlide == 2){
      return 'intro-slide2.png';
    } else{
      return 'intro-slide3.png';
    }
  }

  _setIntroSliderSeenVal() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DataUtils.insertData(prefs, 'intro_slider_shown', 'true');
  }

  _slideButtonText(){
    if(_activeSlide > 2){
      return 'Get Started';}
    else{
      return 'Next';
    }
  }

  _slideSubTitle(){
    if(_activeSlide == 1){
      return 'In publishing and graphic design, Lorem ispum\n is a placeholder text commonly';
    } else if(_activeSlide == 2){
      return 'Lorem ipsum dolor sit amet, consectetur\n elit. Aenean sapien';
    } else{
      return 'Curabitur quis blandit ex. Mauris imperdiet\n mi id sagittis. Aenean non';
    }
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
          child: Column(
            children: <Widget>[
              Image.asset(
                'lib/app/assets/${_slideImage()}', 
                height: MediaQuery.of(context).size.height * 0.5, 
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.36,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _slideTitle(), 
                      style: TextStyle(
                        color: _blackColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      )
                    ),

                    Text(
                      _slideSubTitle(),
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: _blackColor,
                        fontSize: 16,
                      )
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.fiber_manual_record, color: _activeSlide == 1 ? _darkGreen : _lightGreen),
                          onTap: (){
                            setState(() {
                              _activeSlide = 1;
                            });
                          }
                        ),
                        GestureDetector(
                          child: Icon(Icons.fiber_manual_record, color: _activeSlide == 2 ? _darkGreen : _lightGreen),
                          onTap: (){
                            setState(() {
                              _activeSlide = 2;
                            });
                          }
                        ),
                        GestureDetector(
                          child: Icon(Icons.fiber_manual_record, color: _activeSlide == 3 ? _darkGreen : _lightGreen),
                          onTap: (){
                            setState(() {
                              _activeSlide = 3;
                            });
                          }
                        ),
                        
                        
                      ],
                    ),
                    new SizedBox(
                      width: double.infinity,
                      child: Container(
                        width: double.infinity,
                        child: new RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: _darkGreen)
                          ),
                          color: _darkGreen,
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0
                          ),

                          child: new Text(_slideButtonText(), style: TextStyle(color: Colors.white, fontSize: 18.0)),
                          onPressed: () {
                            setState(() {
                              if(_activeSlide == 1 ){
                                _activeSlide = 2;  
                              }
                              else if(_activeSlide == 2){
                                _activeSlide = 3;  
                              }
                              else if(_activeSlide == 3){
                                _setIntroSliderSeenVal();
                                Navigator.pushReplacementNamed(context, 'login'); 
                              }
                            });
                            
                          }
                        ),
                      ),
                    ),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}