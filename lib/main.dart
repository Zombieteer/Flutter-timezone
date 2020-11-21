import 'package:Weatherati/pages/choose_location.dart';
import 'package:Weatherati/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:Weatherati/pages/home.dart';
import 'package:Weatherati/pages/choose_location.dart';
import 'package:Weatherati/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  },
));
