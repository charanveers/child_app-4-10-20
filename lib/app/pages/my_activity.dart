import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swish_child_app/app/utils/static_value.dart';

class MyActivity extends StatefulWidget {
  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  String _selectedTab = "Chores";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Stack(
             children: [
              StaticValues.age>=19?Container():Container(
                   color: Color(0xffD9F7DB),
                   width: double.infinity,height: 300),
              Column(
                children: [
                  StaticValues.age>=19?_adultHeaderd():_childHeader(),
                  SizedBox(height: 10,),
                  Expanded(child:  Container(
                    color: Colors.transparent,
                    child: ListView(
                      children: [
                        _rowAcadmic(),
                        _rowDonation(),
                        _rowHelth(),
                        _goodBadBehavior(
                            AssetImage("lib/app/assets/icons/good.png")),
                        _rowAcadmic(),
                        _rowDonation(),
                        _rowHelth(),
                        _goodBadBehavior(
                            AssetImage("lib/app/assets/icons/good.png")),
                        _rowAcadmic(),
                        _rowDonation(),
                        _rowHelth(),
                        _goodBadBehavior(
                            AssetImage("lib/app/assets/icons/good.png"))
                      ],
                    ),
                  ))
                ],
              )
             ],
        )));
  }


_childHeader()
{
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffD9F7DB),
      boxShadow: [BoxShadow(
        color: Colors.grey,
        blurRadius: 10.0,
      ),],
    ),

    padding: EdgeInsets.only(bottom: 30,top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15),
          child: Text(
            "My Activity",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      _childtab(_selectedTab=="Rewards"?AssetImage(
          'lib/app/assets/rewardtab.png'):AssetImage(
          'lib/app/assets/vouchertab.png'),"All Activity",_selectedTab=="Rewards"?Colors.lightGreen:Colors.white,),
      _childtab(_selectedTab=="Rewards"?AssetImage(
          'lib/app/assets/rewardtab.png'):AssetImage(
          'lib/app/assets/vouchertab.png'),"Acadmics",_selectedTab=="Rewards"?Colors.lightGreen:Colors.white,),
      _childtab(_selectedTab=="Rewards"?AssetImage(
          'lib/app/assets/rewardtab.png'):AssetImage(
          'lib/app/assets/vouchertab.png'),"Chores",_selectedTab=="Rewards"?Colors.lightGreen:Colors.white,),
      _childtab(_selectedTab=="Rewards"?AssetImage(
          'lib/app/assets/rewardtab.png'):AssetImage(
          'lib/app/assets/vouchertab.png'),"Health",_selectedTab=="Rewards"?Colors.lightGreen:Colors.white,),

    ],
  ),
)
      ],
    ),
  );

}

  _adultHeaderd()
  {
    return Container(

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),],

        ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    "My Activity",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              Image(
                image:
                AssetImage("lib/app/assets/icons/swish_text.png"),
                width: 50,
                height: 30,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:_adultTab()
          )
        ],
      ),
    );
  }

  _rowAcadmic() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: StaticValues.age>=19?0.0:10,vertical: StaticValues.age>=19?0.0:5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(StaticValues.age>=19?0.0:15.0))

      ),

      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration:BoxDecoration(
          border: Border(bottom: StaticValues.age>=19?BorderSide(color: Colors.grey[200], width: 1,):BorderSide.none),
        ) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[100],
                            blurRadius: 15.0,
                          ),
                        ],
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                "lib/app/assets/icons/academics.png")))),
                Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Academic performance report.",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Uploaded by institute",
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.grey[200])),
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image(
                                    image:
                                    AssetImage("lib/app/assets/icons/report.png"),
                                    height: 15,
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Performance_report",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      )
    );
  }

  _rowDonation() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: StaticValues.age>=19?0.0:10,vertical: StaticValues.age>=19?0.0:5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(StaticValues.age>=19?0.0:15.0))

        ),

        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration:BoxDecoration(
            border: Border(bottom: StaticValues.age>=19?BorderSide(color: Colors.grey[200], width: 1,):BorderSide.none),
          ) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[100],
                            blurRadius: 15.0,
                          ),
                        ],
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                "lib/app/assets/icons/donate.png")))),
                Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Your donation request has been proceed.",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      )
    );
  }
_adultTab()
{
  return Row(
    children: [
      GestureDetector(
        child: _tabRow(
            _selectedTab == "all"
                ? Colors.lightGreen[100]
                : Colors.white,
            "All",_selectedTab=="all"?Colors.lightGreen:Colors.grey[300]),
        onTap: () {
          setState(() {
            _selectedTab = "all";
          });
        },
      ),
      SizedBox(
        width: 10,
      ),
      GestureDetector(
        child: _tabRow(
            _selectedTab == "Academics"
                ? Colors.lightGreen[100]
                : Colors.white,
            "Academics",_selectedTab=="Academics"?Colors.lightGreen:Colors.grey[300]),
        onTap: () {
          setState(() {
            _selectedTab = "Academics";
          });
        },
      ),
      SizedBox(
        width: 10,
      ),
      GestureDetector(
        child: _tabRow(
            _selectedTab == "Chores"
                ? Colors.lightGreen[100]
                : Colors.white,
            "Chores",_selectedTab=="Chores"?Colors.lightGreen:Colors.grey[300]),
        onTap: () {
          setState(() {
            _selectedTab = "Chores";
          });
        },
      ),
      SizedBox(
        width: 10,
      ),
      GestureDetector(
        child: _tabRow(
            _selectedTab == "Health Goals"
                ? Colors.lightGreen[100]
                : Colors.white,
            "Health Goals",_selectedTab=="Health Goals"?Colors.lightGreen:Colors.grey[300]),
        onTap: () {
          setState(() {
            _selectedTab = "Health Goals";
          });
        },
      )
    ],
  );

}
  _rowHelth() {
    return Container(
      width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: StaticValues.age>=19?0.0:10,vertical: StaticValues.age>=19?0.0:5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(StaticValues.age>=19?0.0:15.0))

      ),

      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration:BoxDecoration(
          border: Border(bottom: StaticValues.age>=19?BorderSide(color: Colors.grey[200], width: 1,):BorderSide.none),
        ) ,

        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[100],
                            blurRadius: 15.0,
                          ),
                        ],
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                "lib/app/assets/icons/health_goals.png")))),
                Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "You completed 1000 steps in a day.",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Rewarded 05 SAR",
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      )








    );
  }

  _goodBadBehavior(AssetImage img) {
    return Container(
      width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: StaticValues.age>=19?0.0:10,vertical: StaticValues.age>=19?0.0:5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(StaticValues.age>=19?0.0:15.0))

      ),

      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration:BoxDecoration(
          border: Border(bottom: StaticValues.age>=19?BorderSide(color: Colors.grey[200], width: 1,):BorderSide.none),
        ) ,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[100],
                            blurRadius: 15.0,
                          ),
                        ],
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        image:
                        new DecorationImage(fit: BoxFit.fill, image: img))),
                Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "You completed 1000 steps in a day.",
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "By",
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey[300],
                                ),
                              ),
                              Text(
                                "Miss Rose",
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),

      )













    );
  }

  _childtab(AssetImage img,String txt,Color color)
  {

    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedTab=txt;
        });
      },
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image:img,
                fit: BoxFit.fill,
              ),

              borderRadius:
              BorderRadius.all(Radius.circular(20))),
          padding:
          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 12,
              color:color,
              fontWeight: FontWeight.bold,
            ),
          )),
    );

  }

  _tabRow(Color color, String text,Color borderColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: borderColor)),
      child: Text(text),
    );
  }
}
