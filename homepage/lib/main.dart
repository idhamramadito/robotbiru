import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/routing/routing_table.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(RobotBiruApp()));
}

class RobotBiruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Robot Biru',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff008AD5), //Colors.blue[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RoutingTable.generateRoute,
    );
  }
}
