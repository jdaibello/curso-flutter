import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const platform = const MethodChannel("floating_button");

  int count = 0;

  @override
  void initState() {
    super.initState();

    platform.setMethodCallHandler((methodCall) {
      if (methodCall.method == "touch") {
        setState(() {
          count += 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Button Demo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "$count",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
            RaisedButton(
              child: Text("Create"),
              onPressed: () {
                platform.invokeMethod("create");
              },
            ),
            RaisedButton(
              child: Text("Show"),
              onPressed: () {
                platform.invokeMethod("show");
              },
            ),
            RaisedButton(
              child: Text("Hide"),
              onPressed: () {
                platform.invokeMethod("hide");
              },
            ),
            RaisedButton(
              child: Text("Verify"),
              onPressed: () {
                platform.invokeMethod("isShowing").then((isShowing) {
                  print(isShowing);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
