import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle transparentNotifAndNavBar() {
  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}

SystemUiOverlayStyle transparentNotifBar() {
  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  );
}

SystemUiOverlayStyle transparentNavBar() {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
