import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greetings = '';
  String greetings2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 500, // Specify width of the container
              height: 200, // Specify height of the container
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/test.png'),
                  fit: BoxFit.cover, // Adjust the image fit as per your requirement
                ),
              ),
            ),
            Text(
              greetings,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              greetings2,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var url = Uri.parse('http://127.0.0.1:5000/');
                      final response = await http.get(url);

                      final decoded =
                          json.decode(response.body) as Map<String, dynamic>;

                      setState(() {
                        greetings = decoded['greetings'];
                        greetings2 = decoded['greetings2'];
                      });
                    },
                    child: Text('Get Data'),
                  ),
                  SizedBox(width: 20), // Changed to width for horizontal spacing
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        greetings = '';
                        greetings2 = '';
                      });
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
