import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Constants/global_variables.dart';
import 'package:shopping_app/Features/auth/screens/auth_screen.dart';
import 'package:shopping_app/router.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AuthScreen(),
    );
  }
}
