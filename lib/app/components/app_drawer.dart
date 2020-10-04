import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swish_child_app/app/pages/about_us.dart';
import 'package:swish_child_app/app/pages/child_boy/donate.dart';
import 'package:swish_child_app/app/pages/child_boy/my_acadim.dart';
import 'package:swish_child_app/app/pages/child_boy/reward_donate.dart';
import 'package:swish_child_app/app/utils/data_utils.dart';

class AppDrawer extends StatelessWidget{
  @required
  Color _blackColor = Color(0xff1f1f1f);
  Color _darkGreen = Color(0xff42bc6c);
  Color _lightGreen = Color(0xffceedd9);
  _menuItem(BuildContext context, String itemText, String itemImageName, String itemLink){
    return ListTile(
      title: Text(
        itemText,
        style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),
      ),
      leading: Image.asset('lib/app/assets/icons/$itemImageName', height: 40),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
    );
  }
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
            height: 220,
            child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("lib/app/assets/green_background.png"),
                              fit: BoxFit.cover
                          )
                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('lib/app/assets/icons/male_child.png'),
                                      fit: BoxFit.cover
                                  ),
                                  shape: BoxShape.circle
                              )
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Jonathan Smith',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'abc@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ]
                    ),
                  )
                ]
            )
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
             GestureDetector(
               child: _menuItem(context, 'Rewards & Vouchers', 'reward.png', '') ,
               onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => RewardDonate()),);
               },
             ),
              SizedBox(height: 10),
              GestureDetector(
                child:_menuItem(context, 'My Acamdemics', 'academics.png', ''),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAcademic()),);
                },
              ),
              SizedBox(height: 10),
              GestureDetector(
                child:  _menuItem(context, 'Donate', 'donate.png', ''),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Donate()),);
                },
              ),
              SizedBox(height: 10),
              GestureDetector(
                child: _menuItem(context, 'About', 'about.png', ''),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),);
                },
              ),
              SizedBox(height: 10),

              GestureDetector(
                child:_menuItem(context, 'Privacy Policy', 'privacy.png', ''),
                onTap: (){

                },
              ),
              SizedBox(height: 10),

              GestureDetector(
                child:  _menuItem(context, 'Contact Us', 'contact.png', ''),
              ),
              SizedBox(height: 10),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  leading: Image.asset('lib/app/assets/icons/logout.png', height: 40),
                ),
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  DataUtils.removeData(prefs, 'auth_token');
                  Navigator.pushReplacementNamed(context, 'login');
                },
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Image.asset('lib/app/assets/logo_gray.png'),
              )
            ],
          ),
        )
      ],
    );
  }
}
