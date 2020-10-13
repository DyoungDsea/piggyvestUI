import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _myActivity;
  String _myActivityResult;
  final formKey =  GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[

            Card(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[

                    Container(
                      child: Image.asset('images/piggy-blue.png'),
                      height: 80.0,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Text(
                      "Create a Secure Account",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF083e9e)
                      ),
                    ),
                    Text(
                      "Welcome to the future of Savings & Investments",
                      style: TextStyle(
                        fontSize: 10.0,
                        letterSpacing: .5
                      ),
                    ),
                    SizedBox(height: 50.0,),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )

                    ),

                  ),

                    SizedBox(height: 20.0,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )

                      ),

                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(

                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )

                      ),

                    ),

                    SizedBox(height: 20.0,),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )

                      ),

                    ),

                    SizedBox(height: 20.0,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Referrer Phone or Code ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )

                      ),

                    ),

                    SizedBox(height: 20.0,),
                    DropDownFormField(
                      titleText: 'How did you know about us?',
                      hintText: 'Please choose one',
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Google",
                          "value": "Google",
                        },
                        {
                          "display": "Facebook",
                          "value": "Facebook",
                        },
                        {
                          "display": "Friend",
                          "value": "Friend",
                        },
                        {
                          "display": "Other",
                          "value": "Other",
                        }
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
