import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/provider/auth_service.dart';
import 'package:food_app/screens/home/home-screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => EventProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => NotificationProvider(),
        // ),
      ],
      child: Consumer<AuthService>(
        builder: (context, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food App',
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                body1: TextStyle(color: ksecondaryColor),
                body2: TextStyle(color: ksecondaryColor),
              ),
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
