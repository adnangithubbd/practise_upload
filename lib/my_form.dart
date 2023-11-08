import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey=GlobalKey<FormState>();
  String _inputValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logged in. !'),),
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Form(child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return 'Please enter some text';
                }else{
                  return null;
                }
              },
              onSaved: (value){
                _inputValue=value!;
              },
              decoration: InputDecoration(
                labelText: 'Enter Text',
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),),
      ),
    );
  }
}
