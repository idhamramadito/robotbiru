import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/routing/routing_table.dart';
import 'package:homepage/service/api_service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(RobotBiruApp()));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class RobotBiruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => APIService.create(),
      dispose: (_, APIService service) => service.client.dispose(),
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Robot Biru',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff008AD5), //Colors.blue[600],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '//',
        onGenerateRoute: RoutingTable.generateRoute,
      ),
    );
  }
}
