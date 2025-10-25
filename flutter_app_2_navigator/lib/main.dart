import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_messenger/signin.dart';
import 'package:flutter_messenger/signup.dart';

// GoRouter
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Messenger'),
    ),
    GoRoute(path: '/signin', builder: (context, state) => const SigninScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App!!',
      // для способа с pushNamed
      // routes: {
      //   '/signin': (context) => const SigninScreen(),
      //   '/signup': (context) => const SignupScreen(),
      // },
      routerConfig: _router,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      // для способа с pushNamed
      // routes: {
      //   '/signin': (context) => const SigninScreen(),
      //   '/signup': (context) => const SignupScreen(),
      // },
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Авторизация'),
              onPressed: () {
                // с помощью GoRouter
                context.go('/signin');
                // Navigator.pushNamed(context, '/signin');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Регистрация'),
              onPressed: () {
                // с помощью GoRouter
                context.go('/signup');
                // Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
