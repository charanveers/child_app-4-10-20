import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swish_child_app/app/utils/static_value.dart';

class RewardDonate extends StatefulWidget {
  @override
  _RewardDonateState createState() => _RewardDonateState();
}

class _RewardDonateState extends State<RewardDonate> {
  String selectedTab="Rewards";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
               StaticValues.age>=19? _adultHeaderd():_childHeader(),
            Expanded(child: Container(
              margin: EdgeInsets.only(top: 10),
              color:Colors.grey[200],
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              child: Stack(
                children: [
                 StaticValues.age>=19?Container(): Container(
                   color: Color(0xffD9F7DB),
                   width: MediaQuery.of(context).size.width,
                   height:150,
                 ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                    child:GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (_, index) => Column(mainAxisSize:MainAxisSize.min,children: [rowRewardVoucher()],),
                      itemCount: 20,
                    )
                  )


                ],

              ),
            ))
              ],
            ),
          ),
        ));
  }
_childHeader()
{
  return  Container(
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
        Container(
          decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 10,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15),
          child: Text(
            "Reward & Vouchers",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        _childTab(),
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
          Align(
            alignment: Alignment.topLeft,
            child:Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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

            ],
          ),
          SizedBox(
            height: 20,
          ),
         Row(
           children: [
             _tabRow(Colors.white, "Rewards",Colors.green[100]),
             SizedBox(
               width: 20,
             ),
             _tabRow(Colors.white, "Vouchers",Colors.green[100])
           ],
         )
        ],
      ),
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

  _childTab()
  {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              selectedTab="Rewards";
            });
          },
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: selectedTab=="Rewards"?AssetImage(
                        'lib/app/assets/rewardtab.png'):AssetImage(
                        'lib/app/assets/vouchertab.png'),
                    fit: BoxFit.fill,
                  ),

                  borderRadius:
                  BorderRadius.all(Radius.circular(20))),
              padding:
              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Rewards",
                style: TextStyle(
                  fontSize: 12,
                  color: selectedTab=="Rewards"?Colors.lightGreen:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              selectedTab="Vouchers";
            });

          },
          child:   Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: selectedTab=="Vouchers"?AssetImage(
                        'lib/app/assets/rewardtab.png'):AssetImage(
                        'lib/app/assets/vouchertab.png'),
                    fit: BoxFit.fill,
                  ),

                  borderRadius:
                  BorderRadius.all(Radius.circular(20))),
              padding:
              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Vouchers",
                style: TextStyle(
                  fontSize: 12,
                  color: selectedTab=="Vouchers"?Colors.lightGreen:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        )
      ],
    );
  }

  Widget rowRewardVoucher()
  {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),

      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage("lib/app/assets/excellent.png"),height: 50,width: 50,),
          Text("Excellent",style: TextStyle(color: Colors.lightGreen,fontSize:11),),
          Text("Earned reward",style: TextStyle(color: Colors.black,fontSize:15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          Text("by Miss Kanika",style: TextStyle(color: Colors.black,fontSize:12,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          Text("Aug 04, 2020 | 12:32 PM",style: TextStyle(color: Colors.grey,fontSize:12,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
