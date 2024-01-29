import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// The main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Demo',
      home: InputScreen(),
    );
  }
}

// The main screen of the app with input field, button, and display area.
class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Controller for the text input field.
  TextEditingController _inputController = TextEditingController();
  // Variable to store the displayed text.
  String _displayedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text input field.
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Enter Text',
              ),
            ),
            SizedBox(height: 20),
            // Button to trigger printing of input text.
            ElevatedButton(
              onPressed: () {
                // Retrieve the entered text and print it.
                _displayedText = _inputController.text;
                print('Entered Text: $_displayedText');
              },
              child: Text('Print Input'),
            ),
            SizedBox(height: 20),
            // Display area for the entered text.
            Text(
              'Displayed Text: $_displayedText',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
