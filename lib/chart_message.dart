import 'package:flutter/material.dart';

class ChartMessage extends StatelessWidget {
  const ChartMessage({Key? key, required this.sender, required this.message})
      : super(key: key);

  final String sender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [

        Container(
          margin: EdgeInsets.only(right: 10),

          child: CircleAvatar(
            radius: 20, // Adjust the radius as needed
            backgroundColor: Colors.green,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                this.sender[0],
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(message),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
