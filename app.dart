import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const LearnHubApp());
}

class LearnHubApp extends StatefulWidget {
  const LearnHubApp({super.key});
  @override
  State<LearnHubApp> createState() => _LearnHubAppState();
}

class _LearnHubAppState extends State<LearnHubApp> {
  bool _darkMode = false;
  void toggleDarkMode() => setState(() => _darkMode = !_darkMode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnHub',
      debugShowCheckedModeBanner: false,
      theme:
          _darkMode ? ThemeData.dark() : ThemeData(primarySwatch: Colors.indigo),
      home: LoginScreen(onToggleTheme: toggleDarkMode),
    );
  }
}

// ---------------- LOGIN SCREEN ----------------
class LoginScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const LoginScreen({super.key, required this.onToggleTheme});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(userName: emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text("LearnHub Login"),
        actions: [
          IconButton(onPressed: widget.onToggleTheme, icon: const Icon(Icons.dark_mode))
        ],
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Welcome to LearnHub 🎓',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email')),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 45)),
                    child: const Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";
  final Set<String> completed = {};

  final List<Map<String, String>> courses = [
    {
      'title': 'Flutter Development',
      'description': 'Learn Flutter & Dart for Android and iOS apps.',
      'image': 'https://img.icons8.com/color/96/flutter.png',
      'link': 'https://www.coursera.org/learn/flutter-app-development',
      'certificate': 'Google Flutter Certificate',
      'internship': 'https://internshala.com/internships/flutter-development-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=flutter-basics'
    },
    {
      'title': 'Python Programming',
      'description': 'Master Python from basics to advanced.',
      'image': 'https://img.icons8.com/color/96/python.png',
      'link': 'https://www.coursera.org/specializations/python',
      'certificate': 'University of Michigan Certificate',
      'internship': 'https://internshala.com/internships/python-internship',
      'quiz': 'https://www.w3schools.com/quiztest/quiztest.asp?qtest=PYTHON'
    },
    {
      'title': 'Web Development',
      'description': 'HTML, CSS, JS for interactive websites.',
      'image': 'https://img.icons8.com/color/96/web.png',
      'link': 'https://www.freecodecamp.org/',
      'certificate': 'freeCodeCamp Front-End Certificate',
      'internship': 'https://internshala.com/internships/web-development-internship',
      'quiz': 'https://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML'
    },
    {
      'title': 'Data Science',
      'description': 'Data analysis, visualization, and ML basics.',
      'image': 'https://img.icons8.com/color/96/artificial-intelligence.png',
      'link': 'https://www.coursera.org/professional-certificates/ibm-data-science',
      'certificate': 'IBM Data Science Certificate',
      'internship': 'https://internshala.com/internships/data-science-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=data-science-quiz'
    },
    {
      'title': 'Machine Learning',
      'description': 'Understand algorithms & build ML models.',
      'image': 'https://img.icons8.com/color/96/brain.png',
      'link': 'https://www.coursera.org/learn/machine-learning',
      'certificate': 'Stanford ML Certificate',
      'internship': 'https://internshala.com/internships/machine-learning-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=machine-learning-basics'
    },
    {
      'title': 'Robotics',
      'description': 'Explore robot design, sensors & automation.',
      'image': 'https://img.icons8.com/color/96/robot-2.png',
      'link': 'https://online.stanford.edu/courses/ee261-introduction-robotics',
      'certificate': 'Stanford Robotics Certificate',
      'internship': 'https://internshala.com/internships/robotics-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=robotics-basics'
    },
    {
      'title': 'Communication Networks',
      'description': 'Study TCP/IP, routing, and wireless protocols.',
      'image': 'https://img.icons8.com/color/96/network.png',
      'link': 'https://www.coursera.org/specializations/computer-communications',
      'certificate': 'Networking Fundamentals Certificate',
      'internship': 'https://internshala.com/internships/network-engineering-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=computer-networks'
    },
    {
      'title': 'VLSI Design',
      'description': 'Learn chip design, CMOS, and circuit simulation.',
      'image': 'https://img.icons8.com/color/96/motherboard.png',
      'link': 'https://nptel.ac.in/courses/117105080',
      'certificate': 'NPTEL VLSI Certificate',
      'internship': 'https://internshala.com/internships/vlsi-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=vlsi-design'
    },
    {
      'title': 'Embedded Systems',
      'description': 'Microcontrollers, IoT, and embedded C programming.',
      'image': 'https://img.icons8.com/color/96/microchip.png',
      'link': 'https://www.coursera.org/learn/embedded-systems',
      'certificate': 'University of Colorado Embedded Systems Certificate',
      'internship': 'https://internshala.com/internships/embedded-systems-internship',
      'quiz': 'https://www.proprofs.com/quiz-school/story.php?title=embedded-systems'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = courses
        .where((c) =>
            c['title']!.toLowerCase().contains(query.toLowerCase()) ||
            c['description']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LearnHub Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                        userName: widget.userName,
                        completedCount: completed.length,
                      )),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: "Search courses...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
              onChanged: (val) => setState(() => query = val),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final course = filtered[index];
                final done = completed.contains(course['title']);
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Image.network(course['image']!, width: 50, height: 50),
                    title: Text(course['title']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(course['description']!),
                    trailing: Icon(
                        done ? Icons.check_circle : Icons.arrow_forward_ios,
                        color: done ? Colors.green : Colors.indigo),
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CourseDetail(course: course)));
                      setState(() => completed.add(course['title']!));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- COURSE DETAIL ----------------
class CourseDetail extends StatelessWidget {
  final Map<String, String> course;
  const CourseDetail({super.key, required this.course});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(course['image']!, height: 100),
              const SizedBox(height: 15),
              Text(course['description']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => _launchURL(course['link']!),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    minimumSize: const Size(double.infinity, 45)),
                child: const Text('Start Learning'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _launchURL(course['internship']!),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size(double.infinity, 45)),
                child: const Text('💼 Internship Link'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _launchURL(course['quiz']!),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 45)),
                child: const Text('🧠 Take a Quiz'),
              ),
              const SizedBox(height: 25),
              Card(
                color: Colors.indigo[50],
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: const Text('🎓 Certificate Info'),
                  subtitle: Text(course['certificate']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatelessWidget {
  final String userName;
  final int completedCount;
  const ProfileScreen(
      {super.key, required this.userName, required this.completedCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage('https://img.icons8.com/color/96/student.png'),
            ),
            const SizedBox(height: 15),
            Text(userName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Courses Completed: $completedCount / 9'),
            const Divider(height: 30),
            const Text(
              '📘 About LearnHub:\nLearnHub helps students explore tech courses, '
              'earn certificates, and find internships — all in one app.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LearnHubApp()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout),
              
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 45)),
            )
          ],
        ),
      ),
    );
  }
}
