import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/my_class/firebase_auth_error.dart';
import 'package:share_box/my_class/firebase_auth_login.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/Pages/new_register.dart';
import 'package:share_box/utils/dimensions.dart';

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
    return GetMaterialApp(
      //demoの赤帯削除
      debugShowCheckedModeBanner: false,
      title: '教科書売買プラットフォーム',
      theme: ThemeData(
        //アプリ全体のテーマ色は緑
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'LoginPage!'),
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
  //文字をサーバーに送るために覚えておく変数
  final idController = TextEditingController();
  String _id = '';
  final passwordController = TextEditingController();
  String _password = '';

  //キーの保存用変数
  final _formKey = GlobalKey<FormState>();
  final _formPWKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン無効化
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('ログイン'),
        body: Container(
          //画面を横一杯に使う
          width: double.infinity,
          //画面端の余白
          padding: MyDrawer.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              //横方向で真ん中
              mainAxisAlignment: MainAxisAlignment.center,
              //縦方向で真ん中
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'NITechマリフ',
                  style: TextStyle(
                      fontSize: Dimensions.font52,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.green),
                ),
                //idの入力フォーマット
                TextFormField(
                  controller: idController,
                  key: _formKey,
                  decoration: const InputDecoration(
                    hintText: 'please your student mail',
                    labelText: '学生メール',
                  ),
                ),
                //パスワードの入力フォーマット
                TextFormField(
                  controller: passwordController,
                  key: _formPWKey,
                  //伏字オン
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'please your password',
                    labelText: 'Password',
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'ログイン',
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                    ),
                  ),
                  onPressed: () async {
                    //フォームの入力内容を代入
                    _id = idController.text;
                    _password = passwordController.text;

                    final FirebaseAuthResultStatus signInResult =
                        await FirebaseLogin.signInId(_id, _password);
                    if (signInResult != FirebaseAuthResultStatus.Successful) {
                      final errorMessage =
                          FirebaseAuthExceptionHandler.exceptionMessage(
                              signInResult);
                      FirebaseLogin.showErrorDialog(context, errorMessage);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('正常にログインしました。')));
                      await MyDrawer.movePage(context, Home());
                    }
                  },
                ),
                TextButton(
                  child: Text(
                    '新規会員登録',
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(context, NewRegister());
                  },
                ),
                RaisedButton(
                  child: Text(
                    'デバック用遷移ボタン',
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                    ),
                  ),
                  onPressed: () async {
                    _id = idController.text;
                    _password = passwordController.text;
                    await MyDrawer.movePage(context, Home());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
