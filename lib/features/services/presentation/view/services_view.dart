import 'package:flutter/material.dart';
import 'widgets/services_view_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key, this.initialIndex});
  static const String routeName = '/servicesView';
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ServicesViewBody());
  }
}
