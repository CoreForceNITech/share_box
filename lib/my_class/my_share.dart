import 'package:flutter/material.dart';

//共有(share)のメソッド
import 'package:share_plus/share_plus.dart';

class MyShare {
  static void _share() =>
      Share.share('みんなも教科書を売買しよう!', subject: 'おすすめの教科書売買アプリ!');

  static Widget myShare() {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () => _share(),
    );
  }
}
