import 'package:flutter/material.dart';
import 'package:overdrop/Activity/home.dart';
import 'package:overdrop/Activity/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/loading': (context) => const Loading(),
      },
    ),
  );
}
