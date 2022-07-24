import 'dart:convert';

import 'package:destination_app/beranda.dart';

import 'package:destination_app/userLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'main.dart';
import 'register.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void loginUser() {
    // send post request to server and save response in variable
    var url = Uri.parse('http://3.1.84.135:5001/auth/login');
    var body = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };
    http.post(url, body: body).then((response) async {
      print(response.body);
      // check if auth property in response body is true
      if (!response.body.contains('true')) {
        // set username in get storage
        GetStorage().write('username', _usernameController.text);
        // parse response body to json
        var jsonResponse = await json.decode(response.body);
        GetStorage().write('user_id', jsonResponse['id']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage(selected: 1)),
            (route) => false);
      } else {
        // show error message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid username or password'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              'Mangkat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // make button with rounded corners
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo,
                        ),
                        child: Center(
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: double.infinity,
                            // post data to server
                            onPressed: () {
                              loginUser();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  child: FlatButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                  ),
                  Text(
                    '    Atau    ',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/img/google_logo.png',
                      ),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login with Google',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                // color: Colors.indigo,
              ),
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      )),
    ));
  }
}
