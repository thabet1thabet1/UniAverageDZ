import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniAverageDZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF66BB6A), // Lighter green
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, const Color(0xFFE8F5E9)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo and app name
                Icon(
                  Icons.calculate_rounded,
                  size: 64,
                  color: const Color(0xFF66BB6A),
                ),
                const SizedBox(height: 16),
                Text(
                  'UniAverageDZ',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF66BB6A), // Lighter green
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'CS Engineering GPA Calculator',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 60),
                // Year selection cards
                _buildYearCard(
                  context,
                  'First Year',
                  'Semesters 1 & 2',
                  Icons.looks_one_rounded,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const SemesterSelectionPage(year: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildYearCard(
                  context,
                  'Second Year',
                  'Semesters 3 & 4',
                  Icons.looks_two_rounded,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const SemesterSelectionPage(year: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildYearCard(
                  context,
                  'Speciality',
                  'Semesters 5-10',
                  Icons.school_rounded,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const SpecialitySelectionPage(),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Calculate overall average button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Show a dialog explaining this feature is coming soon
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Coming Soon'),
                              content: const Text(
                                'Overall average calculation will be available in the next update!',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700,
                    ),
                    child: const Text('Calculate Overall Average'),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 20),
                Text(
                  'Based on University of Setif CS Website',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.code, size: 18, color: Color(0xFF66BB6A)),
                    const SizedBox(width: 6),
                    Text(
                      'Created by thabet1thabet1',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(200, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.verified,
                      size: 16,
                      color: Color(0xFF66BB6A),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildYearCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF66BB6A),
                size: 36,
              ), // Lighter green
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF66BB6A), // Lighter green
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class SemesterSelectionPage extends StatelessWidget {
  final int year;

  const SemesterSelectionPage({Key? key, required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int firstSemester = year == 1 ? 1 : 3;
    int secondSemester = year == 1 ? 2 : 4;

    return Scaffold(
      appBar: AppBar(
        title: Text('Year $year Semesters'),
        elevation: 0,
        backgroundColor: const Color(0xFF66BB6A), // Lighter green
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFE8F5E9), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Select a Semester',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose which semester you want to calculate the average for',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              _buildSemesterCard(
                context,
                'Semester $firstSemester',
                'Calculate Semester $firstSemester Average',
                Icons.calculate_outlined,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => GradeInputPage(semester: firstSemester),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSemesterCard(
                context,
                'Semester $secondSemester',
                'Calculate Semester $secondSemester Average',
                Icons.calculate_outlined,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => GradeInputPage(semester: secondSemester),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSemesterCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF66BB6A),
                size: 36,
              ), // Lighter green
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF66BB6A), // Lighter green
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialitySelectionPage extends StatelessWidget {
  const SpecialitySelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Speciality'),
        elevation: 0,
        backgroundColor: const Color(0xFF66BB6A), // Lighter green
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFE8F5E9), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Select Your Speciality',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose your speciality to access semesters 5-10',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              _buildSpecialityCard(
                context,
                'Software Engineering',
                'Semesters 5-10',
                Icons.code_rounded,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const SpecialitySemesterPage(speciality: 'Software Engineering'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialityCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF66BB6A),
                size: 36,
              ), // Lighter green
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF66BB6A), // Lighter green
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialitySemesterPage extends StatelessWidget {
  final String speciality;

  const SpecialitySemesterPage({Key? key, required this.speciality}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(speciality),
        elevation: 0,
        backgroundColor: const Color(0xFF66BB6A), // Lighter green
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFE8F5E9), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Select a Semester',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose which semester you want to calculate the average for',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              ...List.generate(5, (index) {
                int semester = index + 5; // Semesters 5-9
                return Column(
                  children: [
                    _buildSemesterCard(
                      context,
                      'Semester $semester',
                      'Calculate Semester $semester Average',
                      Icons.calculate_outlined,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => GradeInputPage(semester: semester),
                        ),
                      ),
                    ),
                    if (index < 4) const SizedBox(height: 20),
                  ],
                );
              }),
              const SizedBox(height: 20), // Add bottom padding for better scrolling
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSemesterCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF66BB6A),
                size: 36,
              ), // Lighter green
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF66BB6A), // Lighter green
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class GradeInputPage extends StatefulWidget {
  final int semester;

  const GradeInputPage({Key? key, required this.semester}) : super(key: key);

  @override
  State<GradeInputPage> createState() => _GradeInputPageState();
}

class _GradeInputPageState extends State<GradeInputPage> {
  // Modified to store both practical and Exam controllers
  final Map<String, Map<String, TextEditingController>> controllers = {};
  double average = 0.0;
  bool hasCalculated = false;

  // Define the semester data based on the images provided
  late final List<Map<String, dynamic>> courseData;

  @override
  void initState() {
    super.initState();
    // Initialize the course data based on semester
    courseData = getSemesterData(widget.semester);

    // Create controllers for each course
    for (var course in courseData) {
      final String name = course['name'];
      controllers[name] = {};

      if (course['type'] == 'project') {
        // For project type, only create project controller
        controllers[name]!['project'] = TextEditingController();
      } else if (course['hasBothTpTd'] == true) {
        // For courses with both TP and TD
        controllers[name]!['tp'] = TextEditingController();
        controllers[name]!['td'] = TextEditingController();
        controllers[name]!['exam'] = TextEditingController();
      } else if (course['coefficient'] > 1) {
        // Determine if it's TD or TP based on course data
        final practicalType = course['practicalType'] ?? 'td';
        controllers[name]![practicalType] = TextEditingController();
        controllers[name]!['exam'] = TextEditingController();
      } else {
        // For courses with coefficient = 1, only create Exam controller
        controllers[name]!['exam'] = TextEditingController();
      }
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (var courseControllers in controllers.values) {
      for (var controller in courseControllers.values) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  List<Map<String, dynamic>> getSemesterData(int semester) {
    switch (semester) {
      case 1:
        return [
          {
            'name': 'Algorithms and Data Structure 1',
            'coefficient': 6,
            'hasBothTpTd': true,
          },
          {'name': 'Mathematical analysis 1', 'coefficient': 6},
          {'name': 'Computer Architecture 1', 'coefficient': 4},
          {
            'name': 'Introduction to Operating Systems 1',
            'coefficient': 4,
            'practicalType': 'tp',
          },
          {'name': 'Algebra 1', 'coefficient': 4},
          {'name': 'Expression technique', 'coefficient': 1},
          {'name': 'Office automation and WEB', 'coefficient': 1},
        ];
      case 2:
        return [
          {
            'name': 'Algorithms and Data Structure 2',
            'coefficient': 6,
            'hasBothTpTd': true,
          },
          {
            'name': 'Introduction to Operating Systems 2',
            'coefficient': 6,
            'hasBothTpTd': true,
          },
          {'name': 'Mathematical analysis 2', 'coefficient': 6},
          {'name': 'Mathematical Logic', 'coefficient': 4},
          {'name': 'Algebra 2', 'coefficient': 4},
          {'name': 'Probability and Statistics 1', 'coefficient': 4},
          {'name': 'Expression technique', 'coefficient': 1},
        ];
      case 3:
        return [
          {
            'name': 'File Structure and Data Structures',
            'coefficient': 5,
            'practicalType': 'tp',
          },
          {'name': 'Computer Architecture 2', 'coefficient': 5},
          {
            'name': 'Object Oriented Programming 1',
            'coefficient': 5,
            'practicalType': 'tp',
          },
          {'name': 'Algorithmics and complexity', 'coefficient': 4},
          {'name': 'Algebra 3', 'coefficient': 4},
          {'name': 'Mathematical Analysis 3', 'coefficient': 4},
          {'name': 'Probability and Statistics 2', 'coefficient': 2},
          {'name': 'Entrepreneurship', 'coefficient': 1},
        ];
      case 4:
        return [
          {
            'name': 'Object Oriented Programming 2',
            'coefficient': 6,
            'practicalType': 'tp',
          },
          {'name': 'Introduction to Information Systems', 'coefficient': 3},
          {
            'name': 'Introduction to Computer Networks',
            'coefficient': 4,
            'hasBothTpTd': true,
          },
          {'name': 'Introduction to Databases', 'coefficient': 3},
          {'name': 'Language Theory', 'coefficient': 3},
          {'name': 'Graph Theory', 'coefficient': 3},
          {
            'name': 'Multidisciplinary Project',
            'coefficient': 6,
            'type': 'project',
          },
          {'name': 'English 2', 'coefficient': 1},
        ];
      case 5:
        return [
          {
            'name': 'Advanced Algorithms and Complexity',
            'coefficient': 4,
            'hasBothTpTd': true,
          },
          {
            'name': 'Software Engineering',
            'coefficient': 4,
            'hasBothTpTd': true,
          },
          {
            'name': 'Databases: Administration and Architecture',
            'coefficient': 4,
            'practicalType': 'tp',
          },
          {
            'name': 'Operating Systems: Synchronization and Communication',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Optimization Techniques',
            'coefficient': 3,
            'practicalType': 'td',
          },
          {
            'name': 'Foundations of Artificial Intelligence',
            'coefficient': 2,
            'practicalType': 'tp',
          },
        ];
      case 6:
        return [
          {
            'name': 'Software Design',
            'coefficient': 4,
            'hasBothTpTd': true,
          },
          {
            'name': 'Web Programming',
            'coefficient': 3,
            'practicalType': 'tp',
          },
          {
            'name': 'Databases: Optimization and Concurrent Access Management',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Compilation 1',
            'coefficient': 4,
            'hasBothTpTd': true,
          },
          {
            'name': 'Numerical Analysis',
            'coefficient': 4,
            'practicalType': 'td',
          },
          {
            'name': 'Introduction to IT Security',
            'coefficient': 2,
            'hasBothTpTd': true,
          },
        ];
      case 7:
        return [
          {
            'name': 'Advanced Database Concepts',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Project Management',
            'coefficient': 3,
            'practicalType': 'tp',
          },
          {
            'name': 'Advanced Web and Microservices',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Data Mining',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Compilation 2',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Agile Management Methods',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Networks and Protocols',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'HCI: Interface Design and Evaluation',
            'coefficient': 2,
            'practicalType': 'tp',
          },
        ];
      case 8:
        return [
          {
            'name': 'Advanced Information Systems Architecture and Management',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Big Data and NoSQL Databases',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Software Architectures',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Software Process Models and Management',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Software Testing and Quality Assurance',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Performance Modeling and Evaluation',
            'coefficient': 2,
            'practicalType': 'td',
          },
          {
            'name': 'Mobile Operating Systems',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Multidisciplinary Project',
            'coefficient': 3,
            'practicalType': 'tp',
          },
        ];
      case 9:
        return [
          {
            'name': 'Formal Methods for Software Engineering',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'Embedded Software Development',
            'coefficient': 3,
            'practicalType': 'tp',
          },
          {
            'name': 'Video Game Design: Theory and Practice',
            'coefficient': 3,
            'practicalType': 'tp',
          },
          {
            'name': 'Internet of Things (IoT): Concepts and Development',
            'coefficient': 3,
            'hasBothTpTd': true,
          },
          {
            'name': 'DevOps & Cloud Computing',
            'coefficient': 3,
            'practicalType': 'tp',
          },
          {
            'name': 'Software Security',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Mobile Development',
            'coefficient': 2,
            'practicalType': 'tp',
          },
          {
            'name': 'Legal Aspects',
            'coefficient': 1,
            'type': 'exam_only',
          },
        ];
      case 10:
        return [
          {
            'name': 'Final Year Project',
            'coefficient': 12,
            'type': 'project',
          },
          {
            'name': 'Software Entrepreneurship',
            'coefficient': 3,
            'practicalType': 'tp',
          },
          {'name': 'Software Innovation', 'coefficient': 3},
          {'name': 'Software Industry Trends', 'coefficient': 2},
          {'name': 'Career Planning', 'coefficient': 1},
        ];
      default:
        return [];
    }
  }

  void calculateAverage() {
    double totalWeightedGrade = 0;
    double totalCoefficients = 0;
    bool isValid = true;

    for (var course in courseData) {
      final String name = course['name'];
      final double coeff = course['coefficient'].toDouble();
      double finalGrade = 0;

      if (course['type'] == 'project' || name == 'Multidisciplinary Project') {
        // For project type courses, use only the project grade
        final String projectText = controllers[name]!['project']!.text.trim();

        if (projectText.isEmpty) {
          isValid = false;
          break;
        }

        final double projectGrade = _parseGrade(projectText);
        if (projectGrade < 0 || projectGrade > 20) {
          isValid = false;
          break;
        }

        finalGrade = projectGrade;
      } else if (course['hasBothTpTd'] == true) {
        // For courses with both TP and TD
        final String tpText = controllers[name]!['tp']!.text.trim();
        final String tdText = controllers[name]!['td']!.text.trim();
        final String examText = controllers[name]!['exam']!.text.trim();

        if (tpText.isEmpty || tdText.isEmpty || examText.isEmpty) {
          isValid = false;
          break;
        }

        final double tpGrade = _parseGrade(tpText);
        final double tdGrade = _parseGrade(tdText);
        final double examGrade = _parseGrade(examText);

        if (tpGrade < 0 ||
            tpGrade > 20 ||
            tdGrade < 0 ||
            tdGrade > 20 ||
            examGrade < 0 ||
            examGrade > 20) {
          isValid = false;
          break;
        }

        // Calculate the final grade with TP (20%), TD (20%), and Exam (60%)
        finalGrade = (tpGrade * 0.2) + (tdGrade * 0.2) + (examGrade * 0.6);
      } else if (course['type'] == 'exam_only' || name == 'Legal Aspects') {
        // For Legal Aspects, only exam grade is used
        final String examText = controllers[name]!['exam']!.text.trim();

        if (examText.isEmpty) {
          isValid = false;
          break;
        }

        final double examGrade = _parseGrade(examText);
        if (examGrade < 0 || examGrade > 20) {
          isValid = false;
          break;
        }

        finalGrade = examGrade;
      } else if (coeff > 1) {
        // For courses with coefficient > 1, calculate based on practical (40%) and Exam (60%)
        final String practicalType = course['practicalType'] ?? 'td';
        final String practicalText =
            controllers[name]![practicalType]!.text.trim();
        final String examText = controllers[name]!['exam']!.text.trim();

        if (practicalText.isEmpty || examText.isEmpty) {
          isValid = false;
          break;
        }

        final double practicalGrade = _parseGrade(practicalText);
        final double examGrade = _parseGrade(examText);

        if (practicalGrade < 0 ||
            practicalGrade > 20 ||
            examGrade < 0 ||
            examGrade > 20) {
          isValid = false;
          break;
        }

        // Calculate the final grade with practical (40%) and Exam (60%)
        finalGrade = (practicalGrade * 0.4) + (examGrade * 0.6);
      } else {
        // For courses with coefficient = 1, use only the exam grade
        final String examText = controllers[name]!['exam']!.text.trim();

        if (examText.isEmpty) {
          isValid = false;
          break;
        }

        final double examGrade = _parseGrade(examText);
        if (examGrade < 0 || examGrade > 20) {
          isValid = false;
          break;
        }

        finalGrade = examGrade;
      }

      totalWeightedGrade += finalGrade * coeff;
      totalCoefficients += coeff;
    }

    if (isValid && totalCoefficients > 0) {
      setState(() {
        average = totalWeightedGrade / totalCoefficients;
        hasCalculated = true;
      });
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                'Please ensure all grades are entered and between 0 and 20.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  // Helper method to parse grades with both . and , as decimal separators
  double _parseGrade(String gradeText) {
    // Replace comma with dot for parsing
    String normalizedText = gradeText.replaceAll(',', '.');
    return double.tryParse(normalizedText) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester ${widget.semester} Grades'),
        elevation: 0,
        backgroundColor: const Color(0xFF66BB6A), // Lighter green
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFE8F5E9), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Your Grades',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter grades from 0-20 for each course',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                ...courseData.map(
                  (course) => _buildGradeInput(
                    course['name'],
                    course['coefficient'],
                    course['type'] ?? 'regular',
                    course['practicalType'] ?? 'td',
                    course['hasBothTpTd'] ?? false,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 340),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      onPressed: calculateAverage,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                        backgroundColor: const Color(0xFF43A047),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        elevation: 6,
                        shadowColor: Colors.black.withOpacity(0.18),
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                      ),
                      child: const Text(
                        'Calculate Average',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (hasCalculated) ...[
                  const Divider(thickness: 1),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Semester Average',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: _getAverageColor(average),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${average.toStringAsFixed(2)}/20',
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _getAverageMessage(average),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _getAverageColor(average),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradeInput(
    String name,
    int coefficient,
    String type,
    String practicalType,
    bool hasBothTpTd,
  ) {
    // Special case for Multidisciplinary Project: only one input
    if (name == 'Multidisciplinary Project') {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Coef: $coefficient',
                    style: const TextStyle(
                      color: Color(0xFF66BB6A), // Lighter green
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controllers[name]!['project'],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Project grade',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixText: '/20',
              ),
            ),
          ],
        ),
      );
    }
    // Special case for Legal Aspects: only exam input
    if (name == 'Legal Aspects') {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Coef: $coefficient',
                    style: const TextStyle(
                      color: Color(0xFF66BB6A), // Lighter green
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controllers[name]!['exam'],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Exam grade',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixText: '/20',
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Coef: $coefficient',
                  style: const TextStyle(
                    color: Color(0xFF66BB6A), // Lighter green
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (type == 'project') ...[
            // For project type modules, show only project input
            TextField(
              controller: controllers[name]!['project'],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Project grade',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixText: '/20',
              ),
            ),
          ] else if (hasBothTpTd) ...[
            // For modules with both TP and TD
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TP (20%)',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: controllers[name]!['tp'],
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              hintText: 'TP grade',
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixText: '/20',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TD (20%)',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: controllers[name]!['td'],
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              hintText: 'TD grade',
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixText: '/20',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Exam (60%)',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controllers[name]!['exam'],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Exam grade',
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixText: '/20',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ] else if (coefficient > 1) ...[
            // For normal modules with TP/TD and Exam
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${practicalType.toUpperCase()} (40%)',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: controllers[name]![practicalType],
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              hintText: '${practicalType.toUpperCase()} grade',
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixText: '/20',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Exam (60%)',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: controllers[name]!['exam'],
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Exam grade',
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixText: '/20',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ] else ...[
            // For modules with coef = 1, only exam input
            TextField(
              controller: controllers[name]!['exam'],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Exam grade',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixText: '/20',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getAverageColor(double average) {
    if (average >= 14) {
      return Colors.green.shade700; // Excellent
    } else if (average >= 12) {
      return Colors.green.shade500; // Very Good
    } else if (average >= 10) {
      return Colors.amber.shade700; // Good
    } else if (average >= 8) {
      return Colors.orange; // Average
    } else {
      return Colors.red.shade700; // Poor
    }
  }

  String _getAverageMessage(double average) {
    if (average >= 14) {
      return 'Excellent!';
    } else if (average >= 12) {
      return 'Very Good!';
    } else if (average >= 10) {
      return 'Good!';
    } else if (average >= 8) {
      return 'Average';
    } else {
      return 'Need Improvement';
    }
  }
}
