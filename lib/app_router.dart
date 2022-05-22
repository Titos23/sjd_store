import 'package:flutter/material.dart';

import 'app_state_manager.dart';
import 'login_page.dart';

/* This is the main router of the app.
  It is responsible for the navigation of the application
*/
class AppRouter extends RouterDelegate 
  with ChangeNotifier,PopNavigatorRouterDelegateMixin{

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
    
  })
      : navigatorKey = GlobalKey<NavigatorState>() {
    // Add Listeners to the router
      appStateManager.addListener(notifyListeners);
    
  }
    
  @override
  void dispose() {

    super.dispose();
    appStateManager.removeListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Navigator(
      key: navigatorKey,
      pages: [
        if (!appStateManager.isLogin) LoginPage.page()
      ],
    );
    
  }
  
  @override
  Future<void> setNewRoutePath(configuration) async => null;
  
}