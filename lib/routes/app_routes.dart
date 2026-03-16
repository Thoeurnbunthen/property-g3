import 'package:property/screen/login.dart';
import 'package:property/screen/profile.dart';
import 'package:property/screen/signup.dart';
import 'package:property/screen/detailproperty.dart';
import '../screen/home.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const profile = '/profile';
  static const detailproperty = '/detailproperty';

  static final routes = {
    home: (context) => MyHomePage(title: 'Purple Life Home'),
    login: (context) => MyApp(),
    signup: (context) => SignupPage(),
    profile: (context) => ProfilePage(),
    detailproperty: (context) => PropertyDetailPage(),
  };
}
