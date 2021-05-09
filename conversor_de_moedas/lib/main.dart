import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var request = Uri.parse("https://api.hgbrasil.com/finance?key=ec8ff24f");

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor de Moedas \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
