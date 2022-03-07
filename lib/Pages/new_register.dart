import 'package:flutter/material.dart';
import 'package:share_box/my_class/my_drawer.dart';

class NewRegister extends StatefulWidget {
  @override
  _NewRegisterState createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  //文字をサーバーに送るために覚えておく変数
  final nitIdController = TextEditingController();
  String _nitId = '';
  final majorController = TextEditingController();
  String _major = '';
  final idController = TextEditingController();
  String _id = '';
  final passwordController = TextEditingController();
  String _password = '';
  final rePasswordController = TextEditingController();
  String _rePassword = '';

  //チェックボックスの結果を覚えておく変数
  bool _isCheck = false;

  @override
  void dispose() {
    nitIdController.dispose();
    majorController.dispose();
    idController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン有効化
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('新規会員登録'),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '現時点では、このサービスを利用できるのは名工大生のみです。',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.blueAccent,
                      value: _isCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheck = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'あなたは名工大の学生ですか。',
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    if (_isCheck == true)
                      TextFormField(
                        controller: nitIdController,
                        decoration: const InputDecoration(
                          hintText: 'please your university e-mail',
                          labelText: '学生メール',
                        ),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            setState(() {
                              _nitId = text;
                            });
                          }
                        },
                      ),
                    if (_nitId.indexOf('8') == 4 || _nitId.indexOf('9') == 4)
                      const Text(
                        '創造工に所属している1年後期以降の学生は、主軸分野を入力してください。',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    if (_nitId.indexOf('8') == 4 || _nitId.indexOf('9') == 4)
                      TextFormField(
                        controller: majorController,
                        decoration: const InputDecoration(
                          hintText: 'please your major',
                          labelText: '主軸分野',
                        ),
                      ),
                    TextFormField(
                      controller: idController,
                      //制限文字数
                      maxLength: 8,
                      //入力可能キーボード
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'please your student number',
                        labelText: 'ID(学籍番号)',
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'please make password',
                        labelText: 'パスワードの作成',
                      ),
                    ),
                    TextFormField(
                      controller: rePasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'please enter your password again',
                        labelText: 'パスワードの確認',
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  child: const Text('送信'),
                  onPressed: () async {
                    _nitId = nitIdController.text;
                    _major = majorController.text;
                    _id = idController.text;
                    _password = passwordController.text;
                    _rePassword = rePasswordController.text;
                    if (_isCheck == true &&
                        _nitId != '' &&
                        _nitId.contains('@') &&
                        _id.length == 8 &&
                        _password != '' &&
                        _rePassword != '' &&
                        _password == _rePassword) {
                      await MyDrawer.storage.write(key:_id,value:_password);
                      //await MyDrawer.movePage(context, CompleteFirstRegister());
                    }
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