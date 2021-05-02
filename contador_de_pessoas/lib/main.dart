import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de pessoas",
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pessoas: 0",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "Pode Entrar!",
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
        ),
      ],
    ),
  ));
}
