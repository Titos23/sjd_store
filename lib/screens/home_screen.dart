import 'package:flutter/material.dart';
import 'package:store/models/app_state_manager.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static MaterialPage page() {
    return const MaterialPage(
      key: ValueKey(HomePage),
      child: HomePage(),
      name: "/home"
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<AppStateManager>(
      builder: (context, _appStateManager, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:  CrossAxisAlignment.center,
            children:  [
              const SizedBox(height:  200),
              Container(
                color: Colors.blue,
                height: 100,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Log out"),
                onPressed: ()  {
                  Provider.of<AppStateManager>(context, listen: false)
                  .signout();
                }
              ),

            ]
          ),
    );
      }
    );


  }
}