import 'package:flutter/material.dart';
import 'package:hojoborlo_project/home_pages.dart';
import 'package:hojoborlo_project/text_field_example.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_app.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenA(),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    int number = 12;
    String password = "thisIsPassword";
    TextEditingController _pcontrller = TextEditingController();
    TextEditingController _econtroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen A'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 122,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/1.20,
            child: TextField(
              controller: _econtroller,
              decoration: InputDecoration(
                labelText: 'Input Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.20,
            child: TextField(
              controller: _pcontrller,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScreenB(number:  _pcontrller.text , password: _econtroller.text)));
              },
              child: Icon(Icons.place),
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  final String number;
  final String password;

  const ScreenB({required this.number, required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('number from A $number'),
            Text('password from A $password'),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Data to be sent to the second screen
            Map<String, dynamic> sendData = {
              'name': 'John Doe',
              'age': 30,
              // Add other data as needed
            };

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> receivedData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String receivedName = receivedData['name'];
    final int receivedAge = receivedData['age'];

    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Name: $receivedName'),
            Text('Received Age: $receivedAge'),
          ],
        ),
      ),
    );
  }
}
