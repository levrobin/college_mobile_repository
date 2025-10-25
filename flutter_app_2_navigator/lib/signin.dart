import 'package:flutter/material.dart';
import 'package:flutter_messenger/users_list.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sign in',
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
      home: const MyHomePage(title: 'Авторизация'),
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
  Map<String, String> users = {
    'Lev': '123',
    'Alex': '123',
    'Victor': '123',
  };
  bool ok = false;
  bool found = false;

  checkname(txt) {
    print(txt);
    setState(() {
      found = users.containsKey(txt);
    });
  }

  checkPass(pass) {
    setState(() {
      ok = users['Lev'] == pass;
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
                decoration: const InputDecoration(hintText: 'username'),
                onChanged: (txt) {
                  checkname(txt);
                },
              ),
            ),
            Text(found == true ? 'Найден' : 'Не найден'),

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                readOnly: !found,
                decoration: const InputDecoration(hintText: 'password'),
                onChanged: (pass) {
                  checkPass(pass);
                },
              ),
            ),
            if (ok) FloatingActionButton(child: Text("вход"), onPressed: (){
                Navigator.push(context, MaterialPageRoute<void>(builder: (context) => UsersListScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
