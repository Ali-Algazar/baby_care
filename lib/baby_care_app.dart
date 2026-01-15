import 'package:baby_care/core/helper_functions/on_generate_routes.dart';
import 'package:flutter/material.dart';

class BabyCareApp extends StatelessWidget {
  const BabyCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
