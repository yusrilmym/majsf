import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String username = '';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    setState(() {
      loading = false;
    });
  }

  Future<List> _login() async {
    final response =
        await http.post("http://192.168.20.31/pasrah/login.php", body: {
      "iniusername": user.text,
      "inipassword": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Gagal";
      });
    } else {
      if (datauser[0]['level'] == 'Admin') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['level'] == 'press') {
        Navigator.pushReplacementNamed(context, '/PressPage');
      } else if (datauser[0]['level'] == 'general') {
        Navigator.pushReplacementNamed(context, '/GeneralPage');
      } else if (datauser[0]['level'] == 'ps') {
        Navigator.pushReplacementNamed(context, '/PsPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }
//  Future handleSignIn() async {
//    setState(() {
//      loading = true;
//    });
//  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/back.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/logo/nalogo.png',
                width: 280.0,
                height: 240.0,
              )),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                    child: Column(
                      children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: user,
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  icon: Icon(Icons.people),
                                ),
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     Pattern pattern =
                                //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                //     RegExp regex = new RegExp(pattern);
                                //     if (!regex.hasMatch(value))
                                //       return 'Please make sure your email address is valid';
                                //     else
                                //       return null;
                                //   }
                                // },
                              ),
                            ),
                          ),
                        ),

                        //test
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                obscureText: true,
                                controller: pass,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return "The password field cannot be empty";
                                //   } else if (value.length < 6) {
                                //     return "the password has to be at least 6 characters long";
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                   _login();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),

                      ],
                    ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}
