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
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text="";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("hello world")),
    body: Column(children: <Widget>[inoutText(),Text(this.text)])
    );
  }
}

class TextInputWiget extends StatefulWidget {
  Function(String)callback;

  @override
  State<TextInputWiget> createState() => _TextInputWigetState();
}

class _TextInputWigetState extends State<TextInputWiget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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

  void changeText(String text){
    this.setState(() {
      this.text=text;
    });
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
            splashColor: Colors.blue,
            tooltip: "post message",
            onPressed: ()=>{},
            )));
  }
}