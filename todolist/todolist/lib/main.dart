
import 'package:flutter/material.dart';

void main() => runApp(const  MaterialApp(
    home: const Home(),
  ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList",
        style: TextStyle(color: Color.fromARGB(255, 3, 34, 50)),),
        backgroundColor: const Color.fromARGB(255, 130, 175, 211),
      ),
      body:const Center (
        child: Text("hello world"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 130, 175, 211),
        onPressed: ()=>{},
        child: const Text("click"),
      ),
    );
  }
}