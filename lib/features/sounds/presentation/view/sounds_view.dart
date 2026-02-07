import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/sounds/data/repositories/sounds_repository.dart';
import 'package:baby_care/features/sounds/presentation/cubit/sounds_cubit.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/sounds_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoundsView extends StatelessWidget {
  const SoundsView({super.key});
  static const String routeName = '/sounds';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SoundsCubit(sl<SoundsRepository>())..fetchSounds(),
      child: const Scaffold(body: SoundsViewBody()),
    );
  }
}
