import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/models/app_state_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      key: ValueKey(LoginPage),
      child: LoginPage(),
      name: "/login"
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _emailController, _passController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose;
    _passController.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppStateManager(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children:   [
                  const SizedBox(height: 10),
                  const FlutterLogo(
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText:"Email"
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passController,
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
                        child: const Text("Cancel"),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        child: const Text("Submit"),
                        onPressed: () {
                          Provider.of<AppStateManager>(context, listen: false)
                        .login(context,mail: _emailController.text, pass: _passController.text);
                        }
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}