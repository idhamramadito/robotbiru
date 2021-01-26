import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(RobotBiruApp());
}

class RobotBiruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Robot Biru',
        home: Dashboard(),
      );
    // return Provider(
    //   create: (_) => RecomFoodApiService.create(),
    //   dispose: (_, RecomFoodApiService service) => service.client.dispose(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Robot Biru',
    //     home: SplashScreenPage(),
    //   ),
    // );
  }
}

