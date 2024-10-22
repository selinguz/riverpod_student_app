import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_student_app/screens/student_add_screen.dart';
import 'package:gpt_student_app/providers/student_list_notifier.dart';
import 'package:gpt_student_app/screens/student_list_screen.dart';

class GradeListScreen extends ConsumerWidget {
  const GradeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final uniqueGrades = ref.watch(studentListNotifierProvider.notifier).uniqueGrades;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınıflar'),
      ),
      body: ListView.builder(
        itemCount: uniqueGrades.length,
        itemBuilder: (context, index) {
          final grade = uniqueGrades[index];
          return ListTile(
            title: Text('Sınıf: $grade'), // int tipindeki sınıf bilgisi
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudentListScreen(grade: grade),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => StudentAddScreen()),
          );
        },
        tooltip: 'Öğrenci Ekle',
        child: const Icon(Icons.add),
      ),
    );
  }
}
