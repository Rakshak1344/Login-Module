import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

// final uri = 'http://httpbin.org/post';
//   final headers = {'Content-Type': 'application/json'};
//   Map<String, dynamic> body = {'id': 21, 'name': 'bob'};
//   String jsonBody = json.encode(body);
//   final encoding = Encoding.getByName('utf-8');