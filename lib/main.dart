import 'package:flutter/material.dart';
import 'package:hanseinthantiot/network/api_service.dart';
import 'package:hanseinthantiot/ui/batch_home.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(App());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) => {
        print("${event.level.name}:${event.time}:${event.message}"),
      });
  //print("api ${Constant.apiKey}");
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: BatchHome(),
      ),
    );
  }
}
