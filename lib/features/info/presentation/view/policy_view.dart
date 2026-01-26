import 'package:flutter/material.dart';

import 'widgets/policy_view_body.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({super.key});
  static const routeName = '/policy-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PolicyViewBody());
  }
}
