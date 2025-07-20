import 'package:ass2/core/services/injectable_service.dart';
import 'package:ass2/presentation/cubits/notes_cubit.dart';
import 'package:ass2/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<NotesCubit>(),
      child: HomeViewBody(),
    );
  }
}
