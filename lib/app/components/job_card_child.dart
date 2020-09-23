import 'package:flutter/material.dart';

class JobCardChild extends StatefulWidget {
  Map<dynamic, dynamic> jobCard;

  JobCardChild(this.jobCard);

  @override
  _JobCardChildState createState() => _JobCardChildState();
}

class _JobCardChildState extends State<JobCardChild> {
  Color _blackColor = Color(0xff1f1f1f);
  Color _darkGreen = Color(0xff42bc6c);
  Color _lightGreen = Color(0xffecf8f0);
  Color _darkRed = Color(0xfffd96a8);
  Color _lightRed = Color(0xfffeeaee);
  Color _choreColor = Color(0xffac8f67);

  Map<dynamic, dynamic> _job;
  @override
  void initState() {
    super.initState();
    _job = widget.jobCard;
  }

  _weekDayCapsule(String day){
    return Container(
        margin: EdgeInsets.only(bottom: 3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _darkGreen,
            border: Border.all(
              color: _darkGreen,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        padding: EdgeInsets.all(2),
        height: 20,
        width: 40,
        child: Text(
            day,
            style: TextStyle(
                color: Colors.white,
                fontSize: 10
            )
        )
    );
  }

  _rewardPenaltyDataCapsule(int amount, String type){
    return Container(
        margin: EdgeInsets.only(left: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: type == 'reward' ? Color(0xffecf8f0) : Color(0xfffeeaee),
            border: Border.all(
              color: type == 'reward' ? Color(0xffecf8f0) : Color(0xfffeeaee),
            ),
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        child: Text(
            "${type == 'reward' ? 'Reward' : 'Penalty'}${type == 'reward' ? ' ' : ' - '}$amount/SAR",
            style: TextStyle(
                color: type == 'reward' ? _darkGreen : _darkRed,
                fontSize: 12,
                fontWeight: FontWeight.w400
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.white)
      ),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,

        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'lib/app/assets/icons/chore_color.png',
                      height: 45,
                      width: 45,
                    )
                )
            ),
            // SizedBox(width: 5),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Chore',
                    style: TextStyle(
                        color: _choreColor,
                        fontSize: 11
                    ),
                  ),
                  Text(
                    'Clean your Room',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Aug 15, 2020 | 09:45 AM',
                    style: TextStyle(
                        color: Color(0xffccccce),
                        fontSize: 11,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Daily Task',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              SizedBox(height: 5),
                              Wrap(
                                children: [
                                  _weekDayCapsule('SUN'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('MON'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('TUE'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('WED'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('THU'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('FRI'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('SAT'),
                                  SizedBox(width: 3),
                                  _weekDayCapsule('SAT'),

                                ],
                              )
                            ]
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _rewardPenaltyDataCapsule(10, 'reward'),
                      _rewardPenaltyDataCapsule(10, 'penalty')
                    ],
                  ),
                  Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('lib/app/assets/icons/male_child.png'),
                                      fit: BoxFit.cover
                                  ),
                                  shape: BoxShape.circle
                              )
                          )
                      ),
                      SizedBox(width: 5),
                      Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text(
                                'Jonathan Smith',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Father',
                                style: TextStyle(
                                    color: Color(0xffccccce),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                            ],
                          )
                      )
                    ],
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
