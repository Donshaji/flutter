import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(
            Icons.menu,
            color:  tdBlack,
            size: 30,
          )
        ]),
        backgroundColor: tdBGcolor,),
      body:Container(
        child: Text('This is home screen'),
      )
    );
  }
}

