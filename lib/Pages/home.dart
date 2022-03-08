import 'package:flutter/material.dart';
import 'package:share_box/config/size_config.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/utils/dimensions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchWordController = TextEditingController();
  String _searchWord = '';

  @override
  void dispose() {
    searchWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //画面サイズ管理
    SizeConfig().init(context);
    //web,Android上の戻るボタン有効化
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('Home'),
        body: Container(
          width: double.infinity,
          padding: MyDrawer.paddingSize(),
          child: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: Dimensions.width603,
                  child: TextFormField(
                    controller: searchWordController,
                    decoration: const InputDecoration(
                      hintText: 'please book title',
                      labelText: '書籍名',
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width120,
                  child: RaisedButton(
                    child: const Icon(
                      Icons.search,
                    ),
                    onPressed: () async {
                      _searchWord = searchWordController.text;
                      if (_searchWord != '') {
                        //movePage(context,Page());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context,0),
      ),
    );
  }
}