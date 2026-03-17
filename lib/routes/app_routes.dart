import 'package:property/screen/login.dart';
import 'package:property/screen/profile.dart';
import 'package:property/screen/signup.dart';
import 'package:property/screen/detailproperty.dart';
import 'package:property/screen/edit_profile.dart';
import 'package:property/screen/favorite.dart';

import '../screen/home.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const profile = '/profile';
  static const detailproperty = '/detailproperty';
  static const editProfile = '/edit-profile';
  static const favorite = '/favorite';
  static final routes = {
    home: (context) => MyHomePage(title: 'Purple Life Home'),
    login: (context) => MyApp(),
    signup: (context) => SignupPage(),
    profile: (context) => ProfilePage(),
    favorite: (context) => FavoritePage(),
    detailproperty: (context) => PropertyDetailPage(),
    editProfile: (context) => const EditProfilePage(),
  };
}
