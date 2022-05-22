import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

   static MaterialPage page() {
    return const MaterialPage(
      key: ValueKey(LoginPage),
      child: LoginPage(),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children:   [
                const SizedBox(height: 70),
                const SizedBox(
                  height: 150,
                  child: FlutterLogo(),
                ),
                const SizedBox(height: 100),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText:"Email"
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: "Password"
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ButtonBar(
                  children: [
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {},
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}