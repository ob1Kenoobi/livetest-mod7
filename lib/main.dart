import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        _showDialog();
      }
    });
  }

  void _decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Button pressed $count times"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Count:",
              style: TextStyle(fontSize: 24, color: Colors.purpleAccent),
            ),
            Text(
              "$count",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent),
            ),
            SizedBox(height: 20), // Add spacing here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: _incrementCount,
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: _decrementCount,
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
