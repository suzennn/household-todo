import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'style.dart';
import 'start/welcome.dart';
import 'start/signup.dart';
import 'start/login.dart';
import 'start/getstarted.dart';
import 'session/homepage.dart';
import 'session/todo.dart';
import 'session/profile.dart';
import 'session/profileedit.dart';

const Home = '/';
const LoginRoute = '/login';
const SignUpRoute = '/signup';
const HomeRoute = '/home';
const GetStartedRoute = '/getstarted';
const TodoRoute = '/todo';
const ProfileRoute = '/profile';
const ProfileEditRoute = '/profileedit';

void main() => runApp(MyApp());

final storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Household',
      theme: ThemeData(
        fontFamily: FontNameDefault,
        backgroundColor: Color(0xFF0C324E),
        primaryColor : Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        )
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: Home,
    );
  }
}

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Home:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case LoginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case SignUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case HomeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case GetStartedRoute:
        return MaterialPageRoute(builder:(_) => GetStartedPage());
      case TodoRoute:
        return MaterialPageRoute(builder:(_) => TodoPage());
      case ProfileRoute:
        return MaterialPageRoute(builder:(_) => ProfilePage());
      case ProfileEditRoute:
        return MaterialPageRoute(builder:(_) => ProfileEditPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}')
            )
          )
        );
    }
  }
}

