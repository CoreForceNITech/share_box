import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/Pages/login.dart';
import 'package:share_box/my_class/firebase_auth_login.dart';
import 'package:share_box/my_class/my_drawer.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  //firebaseの呼び出し
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //エラーを検出したら強制修了
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      exit(1);
    }
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserState>(
      create: (context) => UserState(),
      child: GetMaterialApp(
        //demoの赤帯削除
        debugShowCheckedModeBanner: false,
        title: '教科書売買プラットフォーム',
        theme: ThemeData(
          //アプリ全体のテーマ色は緑
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage(title: 'StartPage!'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //ログイン状態のチェック(非同期)
  void checkUser(BuildContext context) async {
    final User? currentUser = await auth.currentUser;
    final userState = Provider.of<UserState>(context, listen: false);
    if (currentUser == null) {
      MyDrawer.movePage(context, Login());
    } else {
      userState.setUser(currentUser);
      MyDrawer.movePage(context, Home());
    }
  }

  @override
  void initState() {
    super.initState();
    checkUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
