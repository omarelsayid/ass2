import 'package:ass2/core/services/injectable_service.dart';
import 'package:ass2/data/models/notes_model.dart';
import 'package:ass2/presentation/cubits/notes_cubit.dart';
import 'package:ass2/presentation/views/widgets/edit_and_add_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAndAddView extends StatelessWidget {
  final NotesModel? note;
  const EditAndAddView({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<NotesCubit>(),
      child: EditAndAddViewBody(note: note),
    );
  }
}
