import 'package:property/screen/login.dart';
import 'package:property/screen/profile.dart';
import 'package:property/screen/signup.dart';
import 'package:property/screen/review.dart';

import '../screen/home.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const profile = '/profile';
  static const review = '/review';

  static final routes = {
    home: (context) => MyHomePage(title: 'Purple Life Home'),
    login: (context) => MyApp(),
    signup: (context) => SignupPage(),
    profile: (context) => ProfilePage(),
    review: (context) => const CaregiverReviewScreen(),
  };
}
