import 'package:property/screen/login.dart';
import 'package:property/screen/profile.dart';
import 'package:property/screen/signup.dart';
import 'package:property/screen/edit_profile.dart';

import '../screen/home.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const profile = '/profile';
  static const editProfile = '/edit-profile';

  static final routes = {
    home: (context) => MyHomePage(title: 'Purple Life Home'),
    login: (context) => MyApp(),
    signup: (context) => SignupPage(),
    profile: (context) => ProfilePage(),
    editProfile: (context) => const EditProfilePage(),
  };
}
