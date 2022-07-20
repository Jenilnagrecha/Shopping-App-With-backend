import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Constants/global_variables.dart';
import 'package:shopping_app/Features/auth/screens/auth_screen.dart';
import 'package:shopping_app/router.dart';
import 'Features/auth/services/auth_service.dart';
import 'common/widgets/bottom_bar.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
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
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
