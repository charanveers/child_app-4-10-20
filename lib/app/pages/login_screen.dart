import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:swish_child_app/app/utils/data_utils.dart';
import 'package:swish_child_app/app/utils/network_utils.dart';
import 'package:swish_child_app/app/components/loading.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _autoValidate = false;
  bool _isLoading = false;
  bool _otpRequested = false;
  bool _otpEntered = false;
  bool _canShowIsdCodeDialog = false;

  int _otp, _enteredOtp;
  
  String _phone;
  int _isdCode = 91;
  Color _blackColor = Color(0xff1f1f1f);
  Color _darkGreen = Color(0xff42bc6c);
  Color _lightGreen = Color(0xffceedd9);

  List<int> _isdCodes = [91, 966];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  _isdCodesSelectOptions(){
    List<Widget> items =[];
    for(int isdCode in _isdCodes){
      items.add(
        FlatButton(
          child: Row(
            children: [
              Expanded(flex: 1, child: _isdCode== isdCode ? Icon(Icons.radio_button_checked, color: _blackColor) : Icon(Icons.radio_button_unchecked, color: _blackColor)),
              Expanded(flex: 6, child: Text("+${isdCode}", style: TextStyle(color: Colors.black)))
            ]
          ),
          onPressed: (){
            setState(() {
              _isdCode = isdCode;
              
            });
          },
        )
      );
    }
    return items;
  }

  _isdCodesDialog(){

    return Container(
      margin: EdgeInsets.all(20),
      color: Colors.white,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            color: Colors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Choose Country ISD Code',style: TextStyle(fontSize: 22, color: Colors.black))
          ),
          Container(
            height: 290,
            color: Colors.white,
            child: ListView(
              children: _isdCodesSelectOptions()
            )
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: SizedBox(
              width: double.infinity,
              child: FlatButton(
                textColor: Colors.black,
                color: Colors.white,
                child: Text('Ok'),
                onPressed: (){
                  setState(() {
                    _canShowIsdCodeDialog = false;
                  });
                },
              ),
            ) 
          )
        ]
      )
    );
  }

  Widget _phoneField(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _canShowIsdCodeDialog = true;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('+${_isdCode}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          ),
          Expanded(
            flex: 6,
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: new TextStyle(
                color: _blackColor,
              ),
              decoration: new InputDecoration.collapsed(
                fillColor: Colors.white,
                hintStyle: TextStyle(color: _blackColor),
                hintText: 'Number',
                filled: true,
                
              ),
              validator: (value) => isValidPhoneNumber(value) ? null : 'Number must be of 8-15 digit',
              onSaved: (String val) {
                _phone = val;
              },
            )
          )
        ],
      )
      
      
    );
  }

  bool isValidPhoneNumber(String input) {
    return input.length >= 8 && input.length <= 15;
  }

  Widget _otpField(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      padding: EdgeInsets.all(10), 
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: new TextStyle(
          height: 1.5,
          color: _blackColor,
        ),
        decoration: new InputDecoration.collapsed(
          fillColor: Colors.white,
          hintStyle: TextStyle(color: _blackColor),
          hintText: 'OTP',
          filled: true,
        ),
        validator: (value) => value == null || value == '' ? 'OTP can not be blank' : null,
        onSaved: (String val) {
          _enteredOtp = int.parse(val);
        },

      )
    );
  }

  _pageTitleText(){
    if(!_otpRequested){
      return "What's your mobile number?";
    }
    else if(_otpRequested){
      return 'Mobile Verification';
    }
  }

  _pageSubmitButtonText(){
    if(!_otpRequested){
      return "Continue";
    }
    else if(_otpRequested){
      return 'Verify';
    }
  }

  _pageSubTitleText(){
    if(!_otpRequested){
      return 'Please enter your mobile number to verify your account';
    }
    else if(_otpRequested){
      return 'We have sent an 4-digit otp to your registered mobile number';
    }
  }

  _sendOtp() async {
    var responseJson = await NetworkUtils.sendOTP(
      _isdCode, _phone, _otp
    );
    setState(() {
      _isLoading = false;
    });
    NetworkUtils.showSnackBar('OTP sent successfully');
    // print(responseJson);
  
    // if(responseJson == null) {
    //   NetworkUtils.showSnackBar('Something went wrong!');
    // } else if(responseJson == 'NetworkError') {
    //   NetworkUtils.showSnackBar(null);
    // } else if(responseJson['status'] == 'error') {
    //   NetworkUtils.showSnackBar('Invalid Email Address');
    // } else {
    //   setState(() {
    //     _otp = responseJson['otp'];
    //     _resetPasswordToken = responseJson['reset_password_token'];
    //     _otpRequested = true;
    //   });

    // }
  }



  _validateOtp() async {
    setState(() {
      _isLoading = false;
    });
    if(_enteredOtp == _otp){
      NetworkUtils.showSnackBar('You have logged in successfully!');

      Navigator.pushReplacementNamed(context, 'home');
    }else{
      NetworkUtils.showSnackBar('Invalid OTP');
    }
  }
  _generateOtp(){
    Random random = new Random();
    setState(() {
      // _otp = random.nextInt(9000) + 1000;
      _otp = 1234;
      _sendOtp();
      _otpRequested = true;
    });
  }

  _loginUser() async {
    var responseJson = await NetworkUtils.loginUser(
      _phone, _isdCode.toString()
    );
    print(responseJson);
  
    if(responseJson == null) {
      NetworkUtils.showSnackBar('Something went wrong!');
    } else if(responseJson == 'NetworkError') {
      NetworkUtils.showSnackBar(null);
    } else if(responseJson['Code'] == 0) {
       setState(() {
        _isLoading = false;
      });
      NetworkUtils.showSnackBar('Invalid mobile number');
    } else {
      String token = responseJson['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      DataUtils.insertData(prefs, 'auth_token', token);
      _generateOtp();
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
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate, 
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child:Stack(
                fit: StackFit.expand,
                children: [ 
                  _isLoading ? Loading() : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      
                      !_otpRequested ? Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'lib/app/assets/logo.jpg', 
                          height: 120, width: 120
                        )
                      ) : GestureDetector(
                        onTap: (){
                          setState(() {
                            _otpRequested = false;
                            _otp = null;
                            _enteredOtp = null;
                          });
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff61abfe),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            padding: EdgeInsets.all(5),
                            height: 30,
                            width: 60,
                            child: Text(
                              '< Back', 
                              style: TextStyle(
                                color: Color(0xff61abfe)
                              )
                            )
                          )
                        )
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            _pageTitleText(), 
                            style: TextStyle(
                              color: _blackColor, 
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        )
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Text(_pageSubTitleText(), style: TextStyle(color: _blackColor, fontSize: 16))),
                        )
                      ),
                      SizedBox(height: 20),
                      !_otpRequested && !_otpEntered ? _phoneField() : Container(),
                      _otpRequested && !_otpEntered ? _otpField() : Container(),
                      SizedBox(height: 20),
                      SizedBox(
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
                              vertical: 10, horizontal: 10
                            ),

                            child: new Text(_pageSubmitButtonText(), style: TextStyle(color: Colors.white, fontSize: 23.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                
                                setState(() {
                                  _isLoading = true;
                                });
                                !_otpRequested ? _loginUser() : _validateOtp();
                                // _requestOtp();
                              } else {
                                setState(() {
                                  _autoValidate = true;
                                });
                              }
                            }
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      !_otpRequested ? new SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("By Signing up you agree to", style: TextStyle(color: _blackColor)),
                              SizedBox(width: 5),
                              GestureDetector(
                                child: Text('Terms of use', style: TextStyle(color: _darkGreen, fontWeight: FontWeight.bold)),
                                onTap: (){
                                },
                              )
                            ],
                          ),
                        )
                      ) : Container(),
                      _otpRequested ? new SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Didn't receive the code?", style: TextStyle(color: _blackColor)),
                              SizedBox(width: 5),
                              GestureDetector(
                                child: Text('Resend', style: TextStyle(color: _darkGreen, fontWeight: FontWeight.bold)),
                                onTap: (){
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  _sendOtp();
                                },
                              )
                            ],
                          ),
                        )
                      ) : Container()
                    ]
                  ),
                  _canShowIsdCodeDialog ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    child: Align(
                      alignment: Alignment.center,
                      child: _isdCodesDialog()
                    )
                  ) : Container()
                ]
              )
            )
          )
        )
      )
    );
  }
}
