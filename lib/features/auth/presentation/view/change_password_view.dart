import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:baby_care/features/auth/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(sl<AuthRepository>()),
      child: Scaffold(body: const ChangePasswordViewBody()),
    );
  }
}
