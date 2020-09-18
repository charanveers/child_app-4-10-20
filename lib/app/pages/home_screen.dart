import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:swish_child_app/app/utils/network_utils.dart';
import 'package:swish_child_app/app/utils/data_utils.dart';

import 'package:swish_child_app/app/components/loading.dart';
import 'package:swish_child_app/app/components/app_drawer.dart';
import 'package:swish_child_app/app/components/job_card.dart';

import 'my_activity.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<dynamic> _categories = [];
  bool _isLoading = true;
  String _authToken;

  Color _blackColor = Color(0xff1f1f1f);
  Color _darkGreen = Color(0xff42bc6c);
  Color _lightGreen = Color(0xffecf8f0);
  Color _darkRed = Color(0xfffd96a8);
  Color _lightRed = Color(0xfffeeaee);
  Color _choreColor = Color(0xffac8f67);

  String _activeJobTab = 'all';
  String _bottomTab = "my_home";

  @override
  void initState() {
    super.initState();
    _fetchSession();
    _isLoading = false;
  }

  _fetchSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = DataUtils.getData(prefs, 'auth_token');
    setState(() {
      _authToken = authToken;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(child: AppDrawer()),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.home, color: _darkGreen, size: 25),
                        SizedBox(height: 3),
                        Text('My Home', style: TextStyle(color: _darkGreen))
                      ],
                    )),
                onTap: () {
                  setState(() {
                    _bottomTab = "my_home";
                  });
                },
              ),
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/app/assets/icons/qr_code.png',
                          height: 22,
                        ),
                        SizedBox(height: 3),
                        Text('Scan QR Code',
                            style: TextStyle(color: Color(0xff98989D)))
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _bottomTab = "my_activity";
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 52,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/app/assets/icons/activity.png',
                          height: 22,
                        ),
                        Text('My Activity',
                            style: TextStyle(color: Color(0xff98989D)))
                      ],
                    )),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
                content: Text('Tab back again to exit',
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black87),
            child: SafeArea(child: _isLoading ? Loading() : _bottomTab=="my_home"?_myHomePage():MyActivity()
            )));
  }

  _myHomePage() {
    return ListView(
      children: <Widget>[
        Container(
            height: 280,
            child: Stack(fit: StackFit.expand, children:[
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("lib/app/assets/green_background.png"),
                          fit: BoxFit.cover))),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        onTap: () {
                                          _scaffoldKey.currentState
                                              .openDrawer();
                                        },
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'lib/app/assets/icons/male_child.png'),
                                                    fit: BoxFit.cover),
                                                shape: BoxShape.circle))),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                      flex: 5,
                                      child: GestureDetector(
                                          onTap: () {
                                            _scaffoldKey.currentState
                                                .openDrawer();
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 8),
                                              Text(
                                                'Hello Jonathan Smith',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                'Good Morning',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ))),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'SWISH',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                  Padding(padding: EdgeInsets.only(bottom: 10),child:       Card(
                      elevation: 1,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.white)),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                      'lib/app/assets/icons/refresh.png'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Your Wallet',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '1260.00/SAR',
                                        style: TextStyle(
                                            color: _darkGreen,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '960.00/SAR',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Saving Account',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text('540.00/SAR',
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                                Text(
                                                  'Expense Account',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              )
                            ]),
                      )),)
                      ])),
            ])),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Chores & Health Goals',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your goals that your parents want you to achieve',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    height: 35,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _activeJobTab = 'all';
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: _activeJobTab == 'all'
                                        ? Colors.white
                                        : Color(0xffefefef),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                        color: _activeJobTab == 'all'
                                            ? Colors.black
                                            : Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                )),
                          ),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _activeJobTab = 'chores';
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: _activeJobTab == 'chores'
                                          ? Colors.white
                                          : Color(0xffefefef),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Chores',
                                      style: TextStyle(
                                          color: _activeJobTab == 'chores'
                                              ? Colors.black
                                              : Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ))),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _activeJobTab = 'health_chores';
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: _activeJobTab == 'health_chores'
                                          ? Colors.white
                                          : Color(0xffefefef),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Health Chores',
                                      style: TextStyle(
                                          color:
                                              _activeJobTab == 'health_chores'
                                                  ? Colors.black
                                                  : Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )))
                        ]))
              ],
            )),
        Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Color(0xfff5f5f5),
            child: Column(
              children: [JobCard({}), JobCard({})],
            ))
      ],
    );
  }
}
