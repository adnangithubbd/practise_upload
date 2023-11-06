import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePagess extends StatelessWidget {
  const HomePagess({super.key});
   final String dataKey='myData';

  Future<void> saveData() async {
   SharedPreferences preferences=await SharedPreferences.getInstance();
   await preferences.setString(dataKey, 'Adnanhabib is the value ');
   print('Data saved....... ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child:const Text('Save data'),
          onPressed: (){
            saveData();
            for(int i=0;i<12;i++){
              print('$i');
            }
          },
        ),
      ),
    );
  }
}
