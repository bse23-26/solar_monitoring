import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'solar_monitoring',
        initialRoute: '/',
        routes: routes
    );
  }
}
