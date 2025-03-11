import 'package:flutter/material.dart';
import 'package:project01/homepage_LMMB.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.amberAccent),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
              appBar: AppBar(title: Text('Flutter Demo')),
              body: Center(child: LoginForm()),
            ),
        '/home': (context) => HomePage_LMMB(),
        '/page1': (context) => Page1_LMMB(),
        '/page2': (context) => Page2_LMMB(),
      },
    ),
  );
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Sign In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Text('Please sign in below'),
        SizedBox(height: 20),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _handleLogin,
          child: Text('Sign In'),
        ),
      ],
    );
  }
}

class Page1_LMMB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(child: Text('This is Page 1')),
    );
  }
}

class Page2_LMMB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(child: Text('This is Page 2')),
    );
  }
}
