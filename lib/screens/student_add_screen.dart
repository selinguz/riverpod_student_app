import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_student_app/models/student.dart';
import 'package:gpt_student_app/providers/student_list_notifier.dart';

class StudentAddScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _gradeController = TextEditingController();

  StudentAddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Öğrenci Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'İsim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen isim girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Soyisim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen soyisim girin';
                  }
                  return null;
                },
              ),
              
              TextFormField(
                controller: _gradeController,
                decoration: const InputDecoration(labelText: 'Sınıf'),
                keyboardType: TextInputType.number, // Sınıf int olarak gireceğiz
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen sınıf girin';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Geçerli bir sınıf numarası girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newStudent = Student(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      
                      grade: int.parse(_gradeController.text), 
                    );

                    ref.read(studentListNotifierProvider.notifier).addStudent(newStudent);

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Öğrenci Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
