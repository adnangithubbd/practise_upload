import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hojoborlo_project/stack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? myData = 'Initial value.. !';
  final String dataKey = "myData";

  Future<void> retriveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      myData = preferences.getString(dataKey);
    });
    print('Retrived data $myData');
  }

  Future<void> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(dataKey, 'Adnan habib is the value ');
    print('Retrived data $myData');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
    // deleteData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // deleteData();
    super.dispose();
  }

  Future<void> deleteData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(dataKey);
    setState(() {
      myData = null;
    });
    print('Data deleted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3,
              child: Card(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(3.12),
                    child: Text(
                      'The text =$myData = inside the card.. !',
                      style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                elevation: 12.20,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.20,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.2)),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.20,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _showSnackBar(context, value.toString());
                    return 'Please enter some text';
                  } else {
                    _showSnackBar(context, value.toString());
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: const Text('password'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.2),
                      // Set border radius for normal state
                      borderSide: const BorderSide(color: Colors.indigo),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.2),
                        borderSide: BorderSide(color: Colors.pink))),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: retriveData,
        child: const Icon(Icons.add),
      ),
    );
  }

  _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text), duration: Duration(seconds: 2)));
  }
}
