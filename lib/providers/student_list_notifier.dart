import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_student_app/models/student.dart';

class StudentListNotifier extends StateNotifier<List<Student>> {
  StudentListNotifier()
      : super([
          Student(firstName: 'Ahmet', lastName: 'Yılmaz', grade: 1),
          Student(firstName: 'Mehmet', lastName: 'Kara', grade: 2),
          Student(firstName: 'Ayşe', lastName: 'Demir', grade: 1),
          Student(firstName: 'Fatma', lastName: 'Çelik', grade: 3),
          Student(firstName: 'Ali', lastName: 'Öztürk', grade: 2),
        ]);

  void addStudent(Student student) {
    state = [...state, student];
  }

  // Sınıflara göre gruplama (int tipinde)
  List<int> get uniqueGrades {
    return state.map((student) => student.grade).toSet().toList()..sort();
  }

  // Belirli bir sınıfa ait öğrencileri getirme
  List<Student> studentsByGrade(int grade) {
    return state.where((student) => student.grade == grade).toList();
  }
}

final studentListNotifierProvider =
    StateNotifierProvider<StudentListNotifier, List<Student>>((ref) {
  return StudentListNotifier();
});
