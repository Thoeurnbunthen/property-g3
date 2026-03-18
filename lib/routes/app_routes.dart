import 'package:flutter/material.dart';
import 'package:property_g3/screen/login.dart';
import 'package:property_g3/screen/profile.dart';
import 'package:property_g3/screen/signup.dart';
import 'package:property_g3/screen/detailproperty.dart';
import 'package:property_g3/screen/edit_profile.dart';
import 'package:property_g3/screen/favorite.dart';
import 'package:property_g3/screen/navbar.dart'; 
import 'package:property_g3/screen/home.dart';
import 'package:property_g3/screen/contact.dart';

class AppRoutes {
  static const String navbar = '/navbar';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String profile = '/profile';
  static const String detailproperty = '/detailproperty';
  static const String editProfile = '/edit-profile';
  static const String favorite = '/favorite';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> routes = {
    navbar: (context) => const NavPage(), 
    home: (context) => const Home(), 
    login: (context) => const LoginPage(), 
    signup: (context) => const SignupPage(),
    profile: (context) => const ProfilePage(),
    favorite: (context) => const FavoritePage(),
    detailproperty: (context) => const PropertyDetailPage(),
    editProfile: (context) => const EditProfilePage(),
    contact: (context) => const ContactPage(),
  };
}