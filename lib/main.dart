import 'package:flutter/material.dart';
import 'package:share_box/config/size_config.dart';
import 'package:share_box/home.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/new_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //画面サイズ管理
    SizeConfig().init(context);
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
          padding: const EdgeInsets.all(8),
          child: Column(
            //横方向で真ん中
            mainAxisAlignment: MainAxisAlignment.center,
            //縦方向で真ん中
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'NITechマリフ',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal! * 10,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.green),
              ),
              //idの入力フォーマット
              TextFormField(
                //最大入力可能文字数
                maxLength: 8,
                controller: idController,
                //入力可能キーボード
                keyboardType: TextInputType.number,
                key: _formKey,
                decoration: const InputDecoration(
                  hintText: 'please your number',
                  labelText: 'ID',
                ),
              ),
              //パスワードの入力フォーマット
              TextFormField(
                controller: passwordController,
                //伏字オン
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'please your password',
                  labelText: 'Password',
                ),
              ),
              RaisedButton(
                child: const Text('ログイン'),
                onPressed: () async {
                  _id = idController.text;
                  _password = passwordController.text;
                  if (_id != '' && _password != '') {
                    //遷移先のページが決まったら変更
                    await MyDrawer.movePage(context, Home());
                  }
                },
              ),
              TextButton(
                child: const Text(
                  '新規会員登録',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  MyDrawer.movePage(context, NewRegister());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
