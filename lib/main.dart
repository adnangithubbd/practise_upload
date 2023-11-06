import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: inputArea(),
            ),
          ),
        ),
      ),
    ),
  ));
}




Widget inputArea() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      TextField(
        decoration: InputDecoration(labelText: 'Username'),
      ),
      SizedBox(height: 12),
      TextField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password'),
      ),
      SizedBox(height: 24),
      ElevatedButton(
        onPressed: () {
          // Handle login button press
        },
        child: Text('Login'),
      ),
    ],
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'hey there i have made some changed in the code... ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
