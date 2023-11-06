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
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 3,
          child: Card(
            child: Center(child: Padding(padding: EdgeInsets.all(3.12),
            child: Text('The text inside the card.. !',

            style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
            ),
            
            ),),
            elevation: 12.20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: retriveData,
        child: const Icon(Icons.add),
      ),
    );
  }
}
