import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swish_child_app/app/components/child_drawer.dart';
import 'package:swish_child_app/app/utils/network_utils.dart';
import 'package:swish_child_app/app/utils/data_utils.dart';
import 'package:swish_child_app/app/components/loading.dart';
import 'package:swish_child_app/app/components/app_drawer.dart';
import 'package:swish_child_app/app/components/job_card.dart';
import 'package:swish_child_app/app/utils/static_value.dart';
import 'child_home.dart';
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

  Widget build(BuildContext context){
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(child: StaticValues.age>=19?new AppDrawer(): ChildDrawer("boy")),
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
                        Icon(Icons.home, color: _bottomTab=="my_home"?_darkGreen:Colors.grey, size: 25),
                        SizedBox(height: 3),
                        Text('My Home', style: TextStyle(color: _bottomTab=="my_home"?_darkGreen:Colors.grey))
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
                          'lib/app/assets/icons/activity.png',color: _bottomTab=="my_activity"?_darkGreen:Colors.grey,
                          height: 22,
                        ),
                        Text('My Activity',
                            style: TextStyle(color: _bottomTab=="my_activity"?_darkGreen:Colors.grey))
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
            child: SafeArea(child: _isLoading ? Loading() : _bottomTab=="my_home"?StaticValues.age>=19?_myHomePage():ChildHome():MyActivity()
            )));
  }


  _myHomePage() {
    return ListView(
      children: <Widget>[
        Container(
            height: 300,
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
                  Padding(padding: EdgeInsets.only(bottom: 10),child:
                  Card(
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
              children: [InkWell(
                child:  JobCard({}),
                onTap: (){
                  _modalBottomSheetChilAdult();
                },

              )

                , JobCard({})],
            ))
      ],
    );
  }



  _modalBottomSheetChilAdult() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return new Container(
            //could change this to Color(0xFF737373),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
              ),
              child: Stack(
                children: [

                  Container(
                    margin: EdgeInsets.only(top: StaticValues.age>=19?0.0:30),

                    width:double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))

                    ),
                    child: Column(
                      children: [
                        SizedBox(height: StaticValues.age>=19?80:60,),
                        Text("New Chore",style: TextStyle(
                            fontSize: 11,
                            color: Colors.brown[300]
                        ),),
                        SizedBox(height: 20,),
                        Text("Clean your Room",style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 20,),
                        Text("Aug 06, 2020 | 09:45 PM",style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500]
                        ),),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("Daily Task",style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Expanded(child:  Wrap(
                              children: [
                                _rowDays("SUN"),
                                SizedBox(height: 10,),
                                _rowDays("MON"),
                                SizedBox(width: 10,),
                                _rowDays("WED"),
                                SizedBox(width: 10,),
                                _rowDays("SUN"),
                                SizedBox(width: 10,),
                                _rowDays("MON"),
                                SizedBox(width: 10,),
                                _rowDays("WED"),

                              ],),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _customButton("Reward 15/SAR",StaticValues.age>=19?Color.fromRGBO(64, 186, 105, 0.20):Color(0xff64D2FF),StaticValues.age>=19?Color(0xff40BB6A):Colors.white),
                            _customButton("Penalty -10/SAR",StaticValues.age>=19?Color.fromRGBO(255, 51, 85, 0.20):Color(0xff64D2FF),StaticValues.age>=19?Color(0xffFF3355):Colors.white)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                      ],

                    ),

                  ),
                  Positioned(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ Container(
                        padding: EdgeInsets.only(top: 4),
                        alignment: Alignment.center,
                        width: 80,
                        height: 80,
                        child: Image(image: AssetImage("lib/app/assets/icons/chore.png"),height: 80,width:80,),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: StaticValues.age>=19?Colors.transparent:Color(0xFF99733E4D)),
                      )
                      ],
                    ),)
                ],
              ));
        });
  }
  _rowDays(String txt)
  {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 10),

      decoration:BoxDecoration(
          color: StaticValues.age>=19?Colors.blue[100]:Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        border:Border.all(color: StaticValues.age>=19?Color(0xff4284FF):Colors.transparent)

      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child:Text(txt,style: TextStyle(
          fontSize: 11,
          color: StaticValues.age>=19?Colors.black:Colors.white,
          fontWeight: FontWeight.bold
      ),),
    );
  }
  _customButton(String txt ,Color color,Color txtColor)
  {
    return Container(
      margin: EdgeInsets.only(left: 20),

      decoration:BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20))

      ),
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 11),
      child:Text(txt,style: TextStyle(
          fontSize: 11,
          color: txtColor,
          fontWeight: FontWeight.bold
      ),),
    );
  }

}
