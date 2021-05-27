import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  await DotEnv.load(fileName: ".env");

  runApp(MyApp());

  await Parse().initialize(
    DotEnv.env['APP_ID'],
    DotEnv.env['SERVER_URL'],
    clientKey: DotEnv.env['CLIENT_KEY'],
    autoSendSessionId: true,
    debug: true,
  );

  /*final category = ParseObject('Categories')
    ..set<String>('Title', 'Meias')
    ..set<int>('Position', 1);

  final response = await category.save();

  print(response.success);*/

  /*final category = ParseObject('Categories')
    ..objectId = 'ZW1RJNsqW8'
    ..set<int>('Position', 3);

  final response = await category.save();

  print(response.success);*/

  final category = ParseObject('Categories')..objectId = 'ZW1RJNsqW8';

  category.delete();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
