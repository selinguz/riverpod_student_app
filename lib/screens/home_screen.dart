import 'package:flutter/material.dart';
import 'package:gpt_student_app/screens/grade_list_screen.dart';
import 'all_students_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Ekran'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // AllStudentsScreen ekranına geçiş yapıyoruz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllStudentsScreen(),
                  ),
                );
              },
              child: const Text('Tüm Öğrencileri Görüntüle'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GradeListScreen(),
                  ),
                );
              },
              child: const Text('Sınıfları Görüntüle'),
            ),
          ],
        ),
      ),
    );
  }
}
