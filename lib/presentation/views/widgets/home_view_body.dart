import 'package:ass2/core/services/theme_service.dart';
import 'package:ass2/presentation/cubits/notes_cubit.dart';
import 'package:ass2/presentation/cubits/notes_state.dart';
import 'package:ass2/presentation/views/edit_and_add_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notes'),
        actions: [
          Consumer<ThemeService>(
            builder: (context, themeServce, child) {
              return Switch(
                value: themeServce.isDarkMode,
                onChanged: (value) {
                  themeServce.changeTheme();
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            final notes = state.notes;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, i) {
                final note = notes[i];

                final formattedDate = DateFormat(
                  'EEE, MMM d • hh:mm a',
                ).format(DateTime.parse(note.date));

                return ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.content ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditAndAddView(note: note),
                    ),
                    (route) => false,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        context.read<NotesCubit>().deleteNote(note.id!),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const EditAndAddView()),
          (route) => false,
        ),
      ),
    );
  }
}
