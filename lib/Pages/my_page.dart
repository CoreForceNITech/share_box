import 'package:flutter/material.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/Pages/main.dart';
import 'package:share_box/Pages/mypage_pages/account_information.dart';
import 'package:share_box/Pages/mypage_pages/browsing_history.dart';
import 'package:share_box/Pages/mypage_pages/exhibited_products.dart';
import 'package:share_box/Pages/mypage_pages/inquiry.dart';
import 'package:share_box/Pages/mypage_pages/privacy_policy.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/utils/dimensions.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, Home());
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('マイページ'),
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: MyDrawer.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(
                            '閲覧履歴',
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () {
                            MyDrawer.movePage(context, BrowsingHistory());
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            '出品した商品',
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () {
                            MyDrawer.movePage(context, ExhibitedProducts());
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'アカウント情報',
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () {
                            MyDrawer.movePage(context, AccountInformation());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: Text(
                    '利用規約/プライバシーポリシー',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: Dimensions.font14,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(context, PrivacyPolicy());
                  },
                ),
                TextButton(
                  child: Text(
                    'お問い合せ',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: Dimensions.font14,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(context, Inquiry());
                  },
                ),
                Text(
                  'Ver1.0.0',
                  style: TextStyle(
                    fontSize: Dimensions.font14,
                  ),
                ),
                TextButton(
                  child: Text(
                    'ログアウト',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: Dimensions.font14,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(
                        context, const MyHomePage(title: 'LoginPage!'));
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 4),
      ),
    );
  }
}
