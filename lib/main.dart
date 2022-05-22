import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/app_state_manager.dart';

import 'app_router.dart';

void main() {
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
