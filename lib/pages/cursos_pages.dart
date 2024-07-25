import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CursosPage extends StatefulWidget {
  const CursosPage({Key? key}) : super(key: key);

  @override
  _CursosPageState createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  List<Map<String, dynamic>> availableCourses = [
    {'id': 1, 'name': 'Lectura', 'description': 'Curso de lectura para principiantes', 'image': 'lib/assets/childlogin.gif'},
    {'id': 2, 'name': 'Matemáticas', 'description': 'Fundamentos de matemáticas', 'image': 'lib/assets/childlogin.gif'},
  ];

  List<Map<String, dynamic>> enrolledCourses = [];

  @override
  void initState() {
    super.initState();
    _loadEnrolledCourses();
  }

  Future<void> _loadEnrolledCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var url = Uri.parse('http://100.29.145.149:3000/enrollment/student/$userId/courses');

      try {
        final response = await http.get(url, headers: headers);
        
        if (response.statusCode == 200) {
          final List<dynamic> coursesData = json.decode(response.body);
          setState(() {
            enrolledCourses = coursesData.map((course) => {
              'id': course['id'],
              'name': course['name'],
              'description': course['description'],
              'progress': 0, // You might want to fetch this from somewhere else
            }).toList();
            
            // Remove enrolled courses from available courses
            availableCourses.removeWhere((course) => 
              enrolledCourses.any((enrolled) => enrolled['id'] == course['id']));
          });
        } else {
          print('Failed to load enrolled courses: ${response.reasonPhrase}');
        }
      } catch (e) {
        print('Exception when loading enrolled courses: $e');
      }
    }
  }

  Future<void> _enrollCourse(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, inicia sesión para inscribirte en un curso.')),
      );
      return;
    }

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.parse('http://100.29.145.149:3000/enrollment/registration');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "studentId": int.parse(userId),
          "courseId": courseId,
          "completed": false
        })
      );

      print("response status ${response.statusCode}");
      print("response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Enrollment successful: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Te has inscrito exitosamente al curso.')),
        );
        
        // Move the course from available to enrolled
        setState(() {
          final enrolledCourse = availableCourses.firstWhere((course) => course['id'] == courseId);
          enrolledCourses.add({...enrolledCourse, 'progress': 0});
          availableCourses.removeWhere((course) => course['id'] == courseId);
        });
      } else {
        print('Enrollment failed: ${response.reasonPhrase}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al inscribirse en el curso: ${response.reasonPhrase}')),
        );
      }
    } catch (e) {
      print('Exception during enrollment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al inscribirse en el curso: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Cursos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (enrolledCourses.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Mis cursos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: enrolledCourses.length,
                itemBuilder: (context, index) {
                  final course = enrolledCourses[index];
                  return Card(
                    child: ListTile(
                      title: Text(course['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course['description']),
                          LinearProgressIndicator(
                            value: course['progress'] / 100,
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        child: Text('Iniciar'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/juegos');
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
            if (availableCourses.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Cursos disponibles',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: availableCourses.length,
                itemBuilder: (context, index) {
                  final course = availableCourses[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(course['image'], width: 50, height: 50),
                      title: Text(course['name']),
                      subtitle: Text(course['description']),
                      trailing: ElevatedButton(
                        child: Text('Iniciar'),
                        onPressed: () => _enrollCourse(course['id']),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}