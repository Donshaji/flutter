import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors. orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home()
    );
  }
}

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text("hello world")),
    body: inoutText()
    );
  }
}


class inoutText extends StatefulWidget {
  const inoutText({super.key});

  @override
  State<inoutText> createState() => _inoutTextState();
}


class _inoutTextState extends State<inoutText> {
  final controller = TextEditingController();
  String text="";

  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void changeText(text){
    if (text=="Hello"){
      controller.clear();
      text="";
    }
    setState(() {
      this.text=text;
    });
    this.text=text;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message:",
          suffixIcon: IconButton(
            icon:Icon(Icons.send),
            onPressed: ()=>{},
            )));
  }
}