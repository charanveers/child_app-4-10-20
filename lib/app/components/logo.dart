import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: MediaQuery.of(context).size.width * 0.2,
      child: Image.asset('lib/app/assets/logo.jpg', height: MediaQuery.of(context).size.height * 0.8, width: MediaQuery.of(context).size.width * 0.8),
    );
  }
}