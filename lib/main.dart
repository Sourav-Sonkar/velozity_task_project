import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velozity_project/screen/login.dart';
import 'package:velozity_project/screen/restaurant_screen.dart';
import 'network/network_connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  NetworkConnection networkConnection = NetworkConnection();
  runApp(MyApp(networkConnection: networkConnection, prefs: prefs));
}

class MyApp extends StatelessWidget {
  final NetworkConnection networkConnection;
  final SharedPreferences prefs;
  const MyApp({Key? key, required this.networkConnection, required this.prefs})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => networkConnection,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: prefs.getBool("isLoggedIn") ?? false
            ? RestaurantScreen.routeName
            : LoginScreen.routeName,
        //initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          RestaurantScreen.routeName: (context) => const RestaurantScreen(),
        },
      ),
    );
  }
}
