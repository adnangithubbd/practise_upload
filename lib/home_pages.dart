import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hojoborlo_project/text_field_example.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePagess extends StatelessWidget {
  const HomePagess({super.key});

  final String dataKey = 'myData';

  Future<void> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(dataKey, 'Adnan habib is the value ');
    print('Data saved....... ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page screen. @'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputArea(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputArea(BuildContext context) {
  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();
  late TextEditingController _controller;

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
      SizedBox(
        width: 150,
        height: 150,
      ),
      ElevatedButton(
        onPressed: () {
          String password = pController.text;
          String email = eController.text;
          print('Email $email and password $password');
          Map<String, dynamic> sendData = {
            'email': email,
            'password': password,
          };

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TextFieldExample(sendData)));

        },
        child: const Text('Login'),
      ),
    ],
  );
}
