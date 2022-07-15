import 'package:flutter/material.dart';
import 'package:multiplication_table_1/table_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final formKey = GlobalKey<FormState>();
  String textFieldVal = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text(
          'Multiplication Tables',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepOrange.shade400,
              Colors.amber.shade400,
            ])),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: ThemeData(
                    primaryColor: Colors.black,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: (val) {
                      setState(() {
                        textFieldVal = val;
                      });
                    },
                    validator: (val) {
                      if (val == "") {
                        return "Please enter any number";
                      } else if (val!.contains('.') || val.contains('-')) {
                        return 'Only number are allowed';
                      } else if (int.parse(val!) < 0 || int.parse(val) > 100000000) {
                        return "Can't be less than 0 and more than 100000000";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    cursorWidth: 3.0,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      hintText: 'Enter number from 1 to 100000000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  color: Colors.black,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TableScreen(
                              val: textFieldVal,
                            )),
                      );
                    }
                  },
                  child:const Text(
                    'Get Table',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
