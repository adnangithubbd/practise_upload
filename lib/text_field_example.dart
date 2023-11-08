import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hojoborlo_project/home_pages.dart';

class TextFielApp extends StatelessWidget {
  const TextFielApp({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

    );
  }
 }
class TextFieldExample extends StatefulWidget {

  final Map<String, dynamic> receivedData;

  TextFieldExample(this.receivedData, {super.key});

  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  @override
  Widget build(BuildContext context) {
    // Access the received data via widget.receivedData
    final String receivedEmail = widget.receivedData['email'].toString();
    final String receivedPassword = widget.receivedData['password'].toString();

    print("Received Email: $receivedEmail");
    print("Received Password: $receivedPassword");

    // Use the received data in your UI or other logic
    // Example:
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Email: $receivedEmail'),
            Text('Received Password: $receivedPassword'),
            // Other widgets using the received data...
          ],
        ),
      ),
    );
  }
}


