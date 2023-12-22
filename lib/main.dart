// ignore: unused_import
import 'package:haizz/models/place.dart';
import 'package:haizz/models/profile.dart';
import 'package:haizz/providers/diaChiModel.dart';
import 'package:haizz/providers/forgotPassViewModel.dart';
import 'package:haizz/providers/loginViewModel.dart';
import 'package:haizz/providers/mainViewModel.dart';
import 'package:haizz/providers/menuBarViewModel.dart';
import 'package:haizz/providers/profileViewModel.dart';
import 'package:haizz/providers/resgisterViewModel.dart';
import 'package:haizz/services/api_services.dart';
import 'package:haizz/ui/AppConstant.dart';
import 'package:haizz/ui/page_forgot_pass.dart';
import 'package:haizz/ui/page_login.dart';
import 'package:haizz/ui/page_main.dart';
import 'package:haizz/ui/page_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService api = ApiService();
  api.initialize();

  Profile profile = Profile();
  profile.initialize;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel()),
    ChangeNotifierProvider<ResgisterViewModel>(
        create: (context) => ResgisterViewModel()),
    ChangeNotifierProvider<ForgotPassViewModel>(
        create: (context) => ForgotPassViewModel()),
    ChangeNotifierProvider<MainViewModel>(
        create: (context) => MainViewModel()),
    ChangeNotifierProvider<MenuBarViewModel>(
        create: (context) => MenuBarViewModel()),
    ChangeNotifierProvider<ProfileViewModel>(
        create: (context) => ProfileViewModel()),
    ChangeNotifierProvider<DiaChiModel>(
        create: (context) => DiaChiModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => PageMain(),
        '/login': (context) => PageLogin(),
        '/register': (context) => PageRegister(),
        '/forgot': (context) => PageForgotPass(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.thirdColor),
        useMaterial3: true,
      ), 
      home: PageLogin(),
    );
  }
}