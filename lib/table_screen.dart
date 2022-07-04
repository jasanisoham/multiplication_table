import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  String val;
  TableScreen({required this.val});
  @override
  _TableScreenState createState() => _TableScreenState();
}

const kTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class _TableScreenState extends State<TableScreen> {
  Widget getRow(int number) {
    return Row(
      children: [
        Expanded(
            child: Center(
                child: Text(
                  '${int.parse(widget.val)}',
                  style: kTextStyle,
                ))),
        Expanded(
            child: Center(
                child: Text(
                  'X',
                  style: kTextStyle,
                ))),
        Expanded(
            child: Center(
                child: Text(
                  '${number.toString()}',
                  style: kTextStyle,
                ))),
        Expanded(
            child: Center(
              child: Text(
                '=',
                style: kTextStyle,
              ),
            )),
        Expanded(
            child: Center(
                child: Text(
                  '${int.parse(widget.val) * number}',
                  style: kTextStyle,
                ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Go back',
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepOrange.shade400,
              Colors.amber.shade400,
            ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getRow(1),
                getRow(2),
                getRow(3),
                getRow(4),
                getRow(5),
                getRow(6),
                getRow(7),
                getRow(8),
                getRow(9),
                getRow(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
