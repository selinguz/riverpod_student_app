import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_student_app/providers/student_list_notifier.dart';

class StudentListScreen extends ConsumerWidget {
  final int grade; // Sınıf bilgisi int olarak

  const StudentListScreen({super.key, required this.grade});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsInGrade =
        ref.watch(studentListNotifierProvider.notifier).studentsByGrade(grade);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sınıf $grade Öğrencileri'),
      ),
      body: ListView.builder(
        itemCount: studentsInGrade.length,
        itemBuilder: (context, index) {
          final student = studentsInGrade[index];
          return ListTile(
            title: Text('${student.firstName} ${student.lastName}'),
          );
        },
      ),
    );
  }
}
