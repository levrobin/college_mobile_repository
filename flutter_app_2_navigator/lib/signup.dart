import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sign up',
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
      home: const MyHomePage(title: 'Регистрация'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController namecont = TextEditingController();
  TextEditingController passcont = TextEditingController();
  List<String> names = ['Lev', 'Alex', 'Victor'];
  bool found = false;

  checkname(txt) {
    print(txt);
    setState(() {
      found = names.contains(txt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: namecont,
                decoration: const InputDecoration(hintText: 'username'),
                onChanged: (txt) {
                  checkname(txt);
                },
              ),
            ),

            Text(found.toString()),

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: passcont,
                decoration: const InputDecoration(hintText: 'password'),
                onChanged: null,
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: passcont,
                decoration: const InputDecoration(hintText: 'confirm password'),
                onChanged: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
