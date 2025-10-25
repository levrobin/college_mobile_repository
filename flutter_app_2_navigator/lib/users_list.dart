import 'package:flutter/material.dart';

class UsersListScreen extends StatelessWidget {
  UsersListScreen({super.key});

  // Map для списка преподавателей
  final Map<int, Map<String, dynamic>> teachers = {
    1: {
      'position': 'Профессор',
      'name': 'Иванов И.И.',
      'phone': '+7 (999) 123-45-67',
    },
    2: {
      'position': 'Доцент',
      'name': 'Петрова П.П.',
      'phone': '+7 (999) 123-45-68',
    },
    3: {
      'position': 'Старший преподаватель',
      'name': 'Сидоров С.С.',
      'phone': '+7 (999) 123-45-69',
    },
  };

  // Map для списка предметов
  final Map<int, Map<String, dynamic>> subjects = {
    1: {'name': 'Математика', 'duration': 90, 'day': 'Понедельник'},
    2: {'name': 'Физика', 'duration': 120, 'day': 'Вторник'},
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'users list',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const UsersListHomePage(title: 'Список преподавателей'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UsersListHomePage extends StatefulWidget {
  const UsersListHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<UsersListHomePage> createState() => _UsersListHomePageState();
}

class _UsersListHomePageState extends State<UsersListHomePage> {
  // Map для списка преподавателей
  final Map<int, Map<String, dynamic>> teachers = {
    1: {
      'position': 'Профессор',
      'name': 'Иванов И.И.',
      'phone': '+7 (999) 123-45-67',
    },
    2: {
      'position': 'Доцент',
      'name': 'Петрова П.П.',
      'phone': '+7 (999) 123-45-68',
    },
    3: {
      'position': 'Старший преподаватель',
      'name': 'Сидоров С.С.',
      'phone': '+7 (999) 123-45-69',
    },
    4: {
      'position': 'Ассистент',
      'name': 'Козлов К.К.',
      'phone': '+7 (999) 123-45-70',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacherKey = teachers.keys.elementAt(index);
          final teacher = teachers[teacherKey]!;
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(
                  teacher['name']!.toString().split(' ')[1][0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                teacher['name']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacher['position']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    teacher['phone']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.phone,
                color: Colors.indigo,
              ),
            ),
          );
        },
      ),
    );
  }
}