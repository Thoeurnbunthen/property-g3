<<<<<<< HEAD
import 'package:property/screen/contact.dart';
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
  static const contact = '/contact';

  static const favorite = '/favorite';
  static final routes = {
    home: (context) => MyHomePage(title: 'Purple Life Home'),
    login: (context) => MyApp(),
    signup: (context) => SignupPage(),
    profile: (context) => ProfilePage(),
    favorite: (context) => FavoritePage(),
    detailproperty: (context) => PropertyDetailPage(),
=======
import 'package:flutter/material.dart';
import 'package:property_g3/screen/login.dart';
import 'package:property_g3/screen/profile.dart';
import 'package:property_g3/screen/signup.dart';
import 'package:property_g3/screen/detailproperty.dart';
import 'package:property_g3/screen/edit_profile.dart';
import 'package:property_g3/screen/favorite.dart';
import 'package:property_g3/screen/navbar.dart'; 
import 'package:property_g3/screen/home.dart';

class AppRoutes {
  static const String navbar = '/navbar';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String profile = '/profile';
  static const String detailproperty = '/detailproperty';
  static const String editProfile = '/edit-profile';
  static const String favorite = '/favorite';

  static Map<String, WidgetBuilder> routes = {
    navbar: (context) => const NavPage(), 
    home: (context) => const Home(), 
    login: (context) => const LoginPage(), 
    signup: (context) => const SignupPage(),
    profile: (context) => const ProfilePage(),
    favorite: (context) => const FavoritePage(),
    detailproperty: (context) => const PropertyDetailPage(),
>>>>>>> 9c26458 (add home page and navbar)
    editProfile: (context) => const EditProfilePage(),
    contact: (context) => const ContactPage(),
  };
}