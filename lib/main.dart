import 'package:flutter/material.dart';
import 'package:hojoborlo_project/home_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_app.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: MyHomePage(title: 'homepage title... !',),
      // body: Padding(
      //   padding: EdgeInsets.all(8),
      //   child: Center(
      //     child: Card(
      //       elevation: 5,
      //       child: Padding(
      //         padding: const EdgeInsets.all(16),
      //         child: MyApp(),
      //       ),
      //     ),
      //   ),
      // ),
    ),
  ));
}

Widget inputArea() {
  TextEditingController eController=TextEditingController();
  TextEditingController pController=TextEditingController();


  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      TextField(

        controller: eController,
        decoration: InputDecoration(
            labelText: 'Email/phone number',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(color: Colors.green),
            )),
      ),
      const SizedBox(height: 12),
      TextField(
        obscureText: true,
        controller: pController,
        decoration: InputDecoration(
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(color: Colors.green),
            )),
      ),
      const SizedBox(height: 24),
      ElevatedButton(
        onPressed: () {
          // Handle login button press
        },
        child: Text('Login'),
      ),
    ],
  );
}



