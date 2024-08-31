import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantta/adminpages/admin.dart';
import 'package:plantta/pages/bottom_navi.dart';
import 'package:plantta/pages/home.dart';
import 'package:plantta/pages/loginsign.dart';
import 'package:plantta/pages/onbord.dart';
import 'package:plantta/pages/onbording.dart';
import 'package:plantta/pages/profile.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavi(),
    );
  }
}
