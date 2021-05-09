import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var request = Uri.parse("https://api.hgbrasil.com/finance?key=ec8ff24f");

void main() async {
  http.Response response = await http.get(request);
  print(json.decode(response.body)["results"]["currencies"]["USD"]);

  runApp(MaterialApp(
    home: Container(),
  ));
}
