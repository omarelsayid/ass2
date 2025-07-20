import 'package:ass2/data/models/notes_model.dart';
import 'package:ass2/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ass2/presentation/cubits/notes_cubit.dart';

class EditAndAddViewBody extends StatefulWidget {
  final NotesModel? note;

  const EditAndAddViewBody({super.key, this.note});

  @override
  State<EditAndAddViewBody> createState() => _EditAndAddViewBodyState();
}

class _EditAndAddViewBodyState extends State<EditAndAddViewBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(
      text: widget.note?.content ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final newNote = NotesModel(
        id: widget.note?.id,
        title: _titleController.text,
        content: _contentController.text,
        date: DateTime.now().toString(),
      );

      final cubit = context.read<NotesCubit>();

      if (widget.note == null) {
        cubit.addNote(newNote);
      } else {
        cubit.updateNote(newNote);
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomeView()),
        (route) => false,
      ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeView()),
            (route) => false,
          ),
        ),
        title: Text(isEdit ? 'Edit Note' : 'Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Content is required' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text(isEdit ? 'Update' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
