import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/theme/theme_data.dart';
import 'package:weather_app/module/provider/pick_location_provider.dart';
import 'package:weather_app/module/views/pick_location_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PickLocationProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Themes.light,
        home: const PickLocationView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
