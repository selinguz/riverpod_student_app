import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/student_list_notifier.dart';

class AllStudentsScreen extends ConsumerWidget {
  const AllStudentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StudentListNotifier'dan öğrenci listesini alıyoruz
    final studentList = ref.watch(studentListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tüm Öğrenciler'),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final student = studentList[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(student.grade.toString()), // Sınıfı gösteriyoruz
              ),
              title: Text('${student.firstName} ${student.lastName}'),
              subtitle: Text('Sınıf: ${student.grade}'),
            ),
          );
        },
      ),
    );
  }
}
