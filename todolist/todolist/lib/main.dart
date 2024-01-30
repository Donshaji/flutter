
import 'package:flutter/material.dart';

void main() => runApp( MaterialApp(
    home: Scaffold(
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
        splashColor:const Color.fromARGB(255, 3, 34, 50),
        onPressed: ()=>{
          const TextStyle(color: Color.fromARGB(255, 255, 255, 255))
        },
        child: const Text("click"),
      ),
    ),
  ));

