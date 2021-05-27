import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: ".env");
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    DotEnv.env['APP_ID'],
    DotEnv.env['SERVER_URL'],
    clientKey: DotEnv.env['CLIENT_KEY'],
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
