import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final bool isError;
  final String errorText;
  ErrorBox({this.isError, this.errorText});

  @override
  Widget build(BuildContext context) {
          print(isError);
          print(errorText);
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          isError ? new Container(
            decoration: new BoxDecoration(
              border: const Border(
                top: const BorderSide(width: 1.0, color: const Color(0xFFFF3F3F)),
                left: const BorderSide(width: 1.0, color: const Color(0xFFFF3F3F)),
                right: const BorderSide(width: 1.0, color: const Color(0xFFFF3F3F)),
                bottom: const BorderSide(width: 1.0, color: const Color(0xFFFF3F3F)),
              ),
              borderRadius: new BorderRadius.circular(10.0)
            ),
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
            margin: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
            child: new Center(
              child: new Text(
                errorText,
                style: new TextStyle(color: Colors.red.shade500),
              ),
            )
          ) : Container(height: 0, width: 0),
        ] // children
      ),
    );
  }
}