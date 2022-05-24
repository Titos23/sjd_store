import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/app_state_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store/firebase_options.dart';

import 'navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
    _appStateManager.init();
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppStateManager(),
        ),
      ],
      child: Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
          return MaterialApp(
            title: 'SJD DOCSTORE',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}
