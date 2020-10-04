import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swish_child_app/app/components/job_card_child.dart';

import 'package:swish_child_app/app/utils/network_utils.dart';
import 'package:swish_child_app/app/utils/data_utils.dart';

import 'package:swish_child_app/app/components/loading.dart';
import 'package:swish_child_app/app/components/app_drawer.dart';
import 'package:swish_child_app/app/components/job_card.dart';

import 'my_activity.dart';

class ChildHome extends StatefulWidget {
  _ChildHomeState createState() => _ChildHomeState();
}

class _ChildHomeState extends State<ChildHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<dynamic> _categories = [];
  bool _isLoading = true;
  String _authToken;

  Color _blackColor = Color(0xff1f1f1f);
  Color _darkGreen = Color(0xffD9F7DB);
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
        backgroundColor: Colors.white,
        body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
                content: Text('Tab back again to exit',
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black87),
            child: SafeArea(
                child: _isLoading
                    ? Loading()
                    : _bottomTab == "my_home" ? _myHomePage() : MyActivity())));
  }

  _myHomePage() {
    return ListView(
      children: <Widget>[
        Container(
            color: Color(0xffD9F7DB),
            height: 270,
            child: Stack(fit: StackFit.expand, children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Color(0xffD9F7DB), boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          blurRadius: 10.0,
                        ),
                      ]),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
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
                                        _scaffoldKey.currentState.openDrawer();
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
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              'Good Morning',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ))),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        alignment: Alignment.topRight,
                                        child: Image(
                                          image: AssetImage(
                                              "lib/app/assets/icons/swish_text_child.png"),
                                          width: 50,
                                          height: 30,
                                        )))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Card(
                          elevation: 1,
                          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.white)),
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: ExactAssetImage('lib/app/assets/wallet_bg.png'),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(15),
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
                                          'lib/app/assets/icons/refresh_child.png',height: 20,width: 20,),
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
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Saving Account',
                                                    textAlign: TextAlign.start,
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
                                                            color: Colors.black,
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
                          )),
                    )
                  ])),
            ])),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            color: Color(0xffD9F7DB),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Chores & Health Goals',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your goals that your parents want you to achieve',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(

                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child:  Text(
                                        'All',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: _activeJobTab == 'all'
                                                ? Colors.black
                                                : Colors.black45,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),),
                                    _activeJobTab=="all"? Container(
                                      height: 5,

                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                                      ),
                                    ):Container()

                                  ],
                                )),
                          ),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _activeJobTab = 'chores';
                                    });
                                  },
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(

                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child:  Text(
                                          'Chores',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: _activeJobTab == 'chores'
                                                  ? Colors.black
                                                  : Colors.black45,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),),
                                      _activeJobTab=="chores"? Container(
                                        height: 5,

                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                                        ),
                                      ):Container()

                                    ],
                                  ))),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _activeJobTab = 'health_chores';
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child:  Text(
                                          'Health Chores',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: _activeJobTab == 'health_chores'
                                                  ? Colors.black
                                                  : Colors.black45,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),),
                                      _activeJobTab=="health_chores"? Container(
                                        height: 5,

                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                                        ),
                                      ):Container()

                                    ],
                                  )))
                        ]))
              ],
            )),
        Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Color(0xfff5f5f5),
            child: Column(
              children: [


               InkWell(
                 child:  JobCardChild({}),
                 onTap: (){


                 },
               ),

                JobCardChild({})],
            ))
      ],
    );
  }
}
