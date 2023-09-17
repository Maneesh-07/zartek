import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/controller/provider/cart_provider.dart';
import 'package:zartek/controller/provider/google_btn_provider.dart';
import 'package:zartek/services/Api/tablemenulist.dart';
import 'package:zartek/views/home/home_page.dart';
import 'package:zartek/views/login/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 menuData = await Apihandler.fetchMenuCategories();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider(),),
        ChangeNotifierProvider(create: (context) => CartModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),  
        home:   const LoginScreen(),
      ),
    );
  }
}
